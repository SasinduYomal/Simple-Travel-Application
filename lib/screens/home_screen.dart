import 'package:flutter/material.dart';
import '../widgets/bannerCard.dart';
import '../widgets/category_card.dart';
import '../widgets/place_card.dart';
import '../screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Hi Sasindu 👋",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.33),
                        padEnds: false,
                        children: [
                          CategoryCard(label: "Beaches", emoji: "🏖️", backgroundColor: Colors.orange[50]!),
                          CategoryCard(label: "Mountains", emoji: "⛰️", backgroundColor: Colors.blueGrey[50]!),
                          CategoryCard(label: "Cities", emoji: "🏙️", backgroundColor: Colors.green[50]!),
                          CategoryCard(label: "Country", emoji: "🌄", backgroundColor: Colors.pink[50]!),
                          CategoryCard(label: "Forests", emoji: "🌲", backgroundColor: Colors.teal[50]!),
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

                    // 1. Mount Lavinia Beach
                    PlaceCard(
                      imagePath: 'assets/mount_lavinia.jpg',
                      title: 'Mount Lavinia Beach',
                      location: 'Colombo',
                      description: 'Scenic beach offering hotels & nearby restaurants.',
                      rating: 4.0,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
                      },
                    ),

                    // 2. Sigiriya Rock
                    PlaceCard(
                      imagePath: 'assets/sigiriya.jpg',
                      title: 'Sigiriya Rock',
                      location: 'Dambulla',
                      description: 'Ancient rock fortress with world-famous frescoes.',
                      rating: 5.0,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
                      },
                    ),

                    // 3. Nine Arch Bridge
                    PlaceCard(
                      imagePath: 'assets/ella.jpg',
                      title: 'Nine Arch Bridge',
                      location: 'Ella',
                      description: 'A beautiful railway bridge surrounded by tea trees.',
                      rating: 4.5,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
                      },
                    ),
                    PlaceCard(
                      imagePath: 'assets/nuwaraeliya.jpg',
                      title: 'Gregory Lake',
                      location: 'Nuwara Eliya',
                      description: 'Gregory Lake is a peaceful attraction surrounded by misty hills.',
                      rating: 3.5,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}