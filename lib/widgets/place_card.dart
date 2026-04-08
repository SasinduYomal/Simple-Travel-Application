import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String description;
  final double rating;

  const PlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          // 📝 Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // ⭐ Rating Stars
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating.floor() ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}