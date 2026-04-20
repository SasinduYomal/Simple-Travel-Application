import 'package:flutter/material.dart';
import '../widgets/favorites_card.dart';
import '../data/places_data.dart'; // Places data import එක [cite: 48]

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Favorite කරපු places විතරක් filter කරනවා [cite: 47]
    final favoritePlaces = places.where((p) => p.isFavourite).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text('My Favorites', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Text('${favoritePlaces.length} saved places', style: const TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 25),

                // List එක empty නම් මේක පෙන්වනවා
                if (favoritePlaces.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(child: Text("No favorites added yet!")),
                  )
                else
                // Favorite places mapping [cite: 34]
                  ...favoritePlaces.map((place) => FavoritePlaceCard(
                    title: place.name,
                    subTitle: place.location,
                    rating: place.rating.toString(),
                    imagePath: place.imagePath,
                  )).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}