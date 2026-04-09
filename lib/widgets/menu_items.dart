import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }
}
