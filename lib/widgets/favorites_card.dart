import 'package:flutter/material.dart';

class FavoritePlaceCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String rating;
  final String imagePath;

  const FavoritePlaceCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subTitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.favorite, color: Colors.pink, size: 26),
          ),
        ],
      ),
    );
  }
}