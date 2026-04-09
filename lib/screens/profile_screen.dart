import 'package:flutter/material.dart';
import '../widgets/status_card.dart';
import '../widgets/menu_items.dart';
import '../widgets/bottom_bar.dart';
import './home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 100, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/profile.jpg"
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Text(
                      "Sasindu Yomal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "sasinduyomal22@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusCard(
                value: "10",
                label: "Visit",
              ),
              StatusCard(
                value: "05",
                label: "Favorites",
              ),
              StatusCard(
                value: "02",
                label: "Reviews",
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              MenuItems(icon: Icons.person_outline, title: "My Profile"),
              MenuItems(icon: Icons.star_outline, title: "My Favorites"),
              MenuItems(icon: Icons.book_online_outlined, title: "My Reviews"),
              MenuItems(icon: Icons.logout, title: "Logout"),
            ],
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
