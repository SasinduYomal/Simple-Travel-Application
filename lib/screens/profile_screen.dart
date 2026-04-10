import 'package:flutter/material.dart';
import '../widgets/status_card.dart';
import '../widgets/menu_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 80, bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  const CircleAvatar(radius: 60, backgroundImage: AssetImage("assets/profile.jpg")),
                  const SizedBox(height: 15),
                  const Text("Sasindu Yomal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                  const Text("sasinduyomal22@gmail.com", style: TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                StatusCard(value: "10", label: "Visit"),
                StatusCard(value: "05", label: "Favorites"),
                StatusCard(value: "02", label: "Reviews"),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              children: const [
                MenuItems(icon: Icons.person_outline, title: "My Profile"),
                MenuItems(icon: Icons.star_outline, title: "My Favorites"),
                MenuItems(icon: Icons.book_online_outlined, title: "My Reviews"),
                MenuItems(icon: Icons.logout, title: "Logout"),
              ],
            )
          ],
        ),
      ),
    );
  }
}