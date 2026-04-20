import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.green)),
        ],
      ),
    );
  }
}
