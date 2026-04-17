import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected; // මේකෙන් තෝරනවා All එක වගේ blue වෙන්න ඕනෙද කියලා

  const CategoryCard({
    super.key,
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        // Selected නම් blue, නැත්නම් සුදු
        color: isSelected ? const Color(0xFF1E60D2) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            // Selected නම් සුදු අයිකන් එකක්, නැත්නම් පාට අයිකන් එකක්
            color: isSelected ? Colors.white : _getIconColor(label),
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // අයිකන් එකේ පාට තීරණය කරන හැටි
  Color _getIconColor(String label) {
    switch (label) {
      case 'Beach': return Colors.orange;
      case 'Mountains': return Colors.green;
      case 'Cities': return Colors.purple;
      default: return Colors.blue;
    }
  }
}