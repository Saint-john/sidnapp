import 'package:cloud_firestore/cloud_firestore.dart';

class SeedService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> seedSampleProperty() async {
    try {
      final String propertyId = 'sample-property-1';
      
      final Map<String, dynamic> propertyData = {
        'id': propertyId,
        'title': 'Luxurious Villa with Ocean View',
        'description': 'Stunning 5-bedroom villa with panoramic ocean views, featuring a private pool, home theater, and state-of-the-art kitchen. Located in an exclusive gated community.',
        'location': 'Malibu, California',
        'price': 12500000.0,
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/luxe-immo-28acd.firebasestorage.app/o/properties%2Fsample-villa.jpg?alt=media',
        'bedrooms': 5,
        'bathrooms': 6,
        'type': 'villa',
        'userId': 'sample-user-1',
        'createdAt': DateTime.now().toIso8601String(),
      };

      await _firestore
          .collection('properties')
          .doc(propertyId)
          .set(propertyData);

      print('Sample property created successfully');
    } catch (e) {
      print('Error creating sample property: $e');
      rethrow;
    }
  }
}
