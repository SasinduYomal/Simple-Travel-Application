import 'package:flutter/material.dart';
import '../widgets/favorites_card.dart';
import '../widgets/bottom_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  'My Favorites',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '3 saved places',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 25),
                const FavoritePlaceCard(
                  title: "Sigiriya",
                  subTitle: "Mathale",
                  rating: "4.7",
                  imagePath: "assets/sigiriya.jpg",
                ),
                const FavoritePlaceCard(
                  title: "Mount Lavinia",
                  subTitle: "Colombo",
                  rating: "3.9",
                  imagePath: "assets/mount_lavinia.jpg",
                ),
                const FavoritePlaceCard(
                  title: "Ella",
                  subTitle: "Badulla",
                  rating: "5.0",
                  imagePath: "assets/ella.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),

    );
  }
}
