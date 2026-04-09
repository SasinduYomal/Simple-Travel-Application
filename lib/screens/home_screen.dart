import 'package:flutter/material.dart';
import '../widgets/bannerCard.dart';
import '../widgets/category_card.dart';
import '../widgets/place_card.dart';
import '../widgets/bottom_bar.dart';
import '../screens/details_screen.dart';
import '../screens/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const BannerCard(),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: PageView(
                        controller: PageController(
                          viewportFraction: 0.33,
                        ),
                        padEnds: false,
                        children: const [
                          CategoryCard(
                            label: "Beaches",
                            emoji: "🏖️",
                            backgroundColor: Color(0xFFFFF3E0),
                          ),
                          CategoryCard(
                            label: "Mountains",
                            emoji: "⛰️",
                            backgroundColor: Color(0xFFF3F2F2),
                          ),
                          CategoryCard(
                            label: "Cities",
                            emoji: "🏙️",
                            backgroundColor: Color(0xFFE8F5E9),
                          ),
                          CategoryCard(
                            label: "Country",
                            emoji: "🌄",
                            backgroundColor: Color(0xFFFCE4EC),
                          ),
                          CategoryCard(
                            label: "Forests",
                            emoji: "🌲",
                            backgroundColor: Color(0xFFE3F2FD),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // 📍 Popular Places Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "Popular Places",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    PlaceCard(
                      imagePath: 'assets/mount_lavinia.jpg',
                      title: 'Mount Lavinia Beach',
                      location: 'Colombo',
                      description: 'Scenic beach offering hotels & nearby restaurants.',
                      rating: 4.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailsScreen(), // 👈 Details page එකට navigate වෙනවා
                          ),
                        );
                      },
                    ),

                    PlaceCard(
                      imagePath: 'assets/sigiriya.jpg',
                      title: 'Sigiriya Rock',
                      location: 'Dambulla',
                      description: 'Ancient rock fortress with world-famous frescoes.',
                      rating: 5.0,
                      onTap: null,
                    ),

                    PlaceCard(
                      imagePath: 'assets/ella.jpg',
                      title: 'Nine Arch Bridge',
                      location: 'Ella',
                      description: 'A beautiful railway bridge surrounded by tea trees.',
                      rating: 4.5,
                      onTap: null,
                    ),
                    PlaceCard(
                      imagePath: 'assets/nuwaraeliya.jpg',
                      title: 'Gregory Lake',
                      location: 'Nuwara Eliya',
                      description: 'Gregory Lake in Nuwara Eliya is a peaceful attraction surrounded by cool-climate greenery and misty hills.',
                      rating: 2.0,
                      onTap: null,
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}