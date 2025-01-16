class Property {
  final String id;
  final String title;
  final String description;
  final String location;
  final double price;
  final String imageUrl;
  final int bedrooms;
  final int bathrooms;
  final String type; // villa, apartment, penthouse
  final String userId;
  final DateTime createdAt;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.bedrooms,
    required this.bathrooms,
    required this.type,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'imageUrl': imageUrl,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'type': type,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      price: map['price'].toDouble(),
      imageUrl: map['imageUrl'],
      bedrooms: map['bedrooms'],
      bathrooms: map['bathrooms'],
      type: map['type'],
      userId: map['userId'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
