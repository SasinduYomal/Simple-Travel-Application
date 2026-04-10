import 'package:flutter/material.dart';
import '../widgets/favorites_card.dart';

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
              children: const [
                SizedBox(height: 30),
                Text('My Favorites', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Text('3 saved places', style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(height: 25),
                FavoritePlaceCard(title: "Sigiriya", subTitle: "Mathale", rating: "4.7", imagePath: "assets/sigiriya.jpg"),
                FavoritePlaceCard(title: "Mount Lavinia", subTitle: "Colombo", rating: "3.9", imagePath: "assets/mount_lavinia.jpg"),
                FavoritePlaceCard(title: "Ella", subTitle: "Badulla", rating: "5.0", imagePath: "assets/ella.jpg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}