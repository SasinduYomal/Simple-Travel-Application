class Place {
  final String id;
  final String name;
  final String location;
  final String description;
  final double rating;
  final String imagePath;
  final String category;
  final bool isFavourite;

  const Place({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.imagePath,
    required this.category,
    this.isFavourite = false,
  });

  Place copyWith({bool? isFavourite}) {
    return Place(
      id: id,
      name: name,
      location: location,
      description: description,
      rating: rating,
      imagePath: imagePath,
      category: category,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}