import 'package:flutter/material.dart';
import '../widgets/bannerCard.dart';
import '../widgets/category_card.dart';
import '../widgets/place_card.dart';
import '../screens/details_screen.dart';
import '../models/place.dart';
import '../data/places_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    List<Place> filteredPlaces = selectedCategory == 'All'
        ? places
        : places.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Hi Sasindu 👋",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerCard(),
              const SizedBox(height: 20),

              // --- Categories Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Categories",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCategoryItem("All", Icons.grid_view_rounded),
                          _buildCategoryItem("Beach", Icons.beach_access_rounded),
                          _buildCategoryItem("Mountains", Icons.terrain_rounded),
                          _buildCategoryItem("Cities", Icons.location_city_rounded),
                          _buildCategoryItem("Lakes", Icons.water),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // --- Popular Places Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Places",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    ...filteredPlaces.map((place) {
                      return PlaceCard(
                        name: place.name,
                        location: place.location,
                        imagePath: place.imagePath,
                        description: place.description,
                        rating: place.rating,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailsScreen(place: place))
                          );
                        },
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: CategoryCard(
        label: title,
        icon: icon,
        isSelected: selectedCategory == title,
      ),
    );
  }
}