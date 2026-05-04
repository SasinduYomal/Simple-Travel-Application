import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  LatLng? _selectedLatLng;
  String _selectedLocationName = "";

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');

    try {
      final response = await http.get(url, headers: {'User-Agent': 'TravelingApp/1.0'});
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        if (data.isNotEmpty) {
          double lat = double.parse(data[0]['lat']);
          double lon = double.parse(data[0]['lon']);
          String displayName = data[0]['display_name'].split(',')[0];

          setState(() {
            _selectedLatLng = LatLng(lat, lon);
            _selectedLocationName = displayName;
            _mapController.move(_selectedLatLng!, 14.0);
          });
          FocusScope.of(context).unfocus();
        } else {
          _showSnackBar("Location not found!");
        }
      }
    } catch (e) {
      _showSnackBar("Error searching: $e");
    }
  }

  Future<void> _addToTrip() async {
    if (_selectedLatLng == null) return;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      try {
        await FirebaseFirestore.instance.collection('trips').add({
          'locationName': _selectedLocationName,
          'latitude': _selectedLatLng!.latitude,
          'longitude': _selectedLatLng!.longitude,
          'travelDate': pickedDate,
          'addedAt': Timestamp.now(),
        });

        _showSnackBar("Trip planned for ${DateFormat('yyyy-MM-dd').format(pickedDate)}!");

        setState(() {
          _selectedLatLng = null;
          _searchController.clear();
        });
      } catch (e) {
        _showSnackBar("Failed to add: $e");
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Your Trip"),
        backgroundColor: const Color(0xFF1E60D2),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(initialCenter: LatLng(7.8731, 80.7718), initialZoom: 8.0),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.traveling_app',
              ),
              if (_selectedLatLng != null)
                MarkerLayer(markers: [
                  Marker(
                    point: _selectedLatLng!,
                    width: 80, height: 80,
                    child: const Icon(Icons.location_on, color: Colors.red, size: 45),
                  ),
                ]),
            ],
          ),
          Positioned(
            top: 20, left: 15, right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)]),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search destination...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(icon: const Icon(Icons.search, color: Color(0xFF1E60D2)), onPressed: () => _searchLocation(_searchController.text)),
                ),
                onSubmitted: (value) => _searchLocation(value),
              ),
            ),
          ),
          if (_selectedLatLng != null)
            Positioned(
              bottom: 20, left: 20, right: 80,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  title: Text(_selectedLocationName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: ElevatedButton(
                    onPressed: _addToTrip,
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E60D2)),
                    child: const Text("Add", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}