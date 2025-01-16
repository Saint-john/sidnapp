import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import '../models/property.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _uuid = const Uuid();

  // Get all properties
  Stream<List<Property>> getProperties() {
    return _firestore
        .collection('properties')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Property.fromMap(doc.data())).toList();
    });
  }

  // Get properties by type
  Stream<List<Property>> getPropertiesByType(String type) {
    return _firestore
        .collection('properties')
        .where('type', isEqualTo: type)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Property.fromMap(doc.data())).toList();
    });
  }

  // Add new property
  Future<String> addProperty({
    required String title,
    required String description,
    required String location,
    required double price,
    required File imageFile,
    required int bedrooms,
    required int bathrooms,
    required String type,
    required String userId,
  }) async {
    try {
      // Upload image first
      final String imageFileName = '${_uuid.v4()}.jpg';
      final Reference storageRef = _storage.ref().child('properties/$imageFileName');
      
      // Set metadata to specify content type
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': imageFile.path},
      );

      // Upload the file with metadata
      await storageRef.putFile(imageFile, metadata);
      
      // Get the download URL
      final String imageUrl = await storageRef.getDownloadURL();

      // Create property document
      final String propertyId = _uuid.v4();
      final property = Property(
        id: propertyId,
        title: title,
        description: description,
        location: location,
        price: price,
        imageUrl: imageUrl,
        bedrooms: bedrooms,
        bathrooms: bathrooms,
        type: type,
        userId: userId,
        createdAt: DateTime.now(),
      );

      // Save to Firestore
      await _firestore
          .collection('properties')
          .doc(propertyId)
          .set(property.toMap());

      print('Property created successfully with ID: $propertyId');
      return propertyId;
    } catch (e, stackTrace) {
      print('Error creating property: $e');
      print('Stack trace: $stackTrace');
      throw Exception('Failed to create property: $e');
    }
  }

  // Delete property
  Future<void> deleteProperty(String propertyId, String imageUrl) async {
    // Delete image from storage
    if (imageUrl.isNotEmpty) {
      try {
        final Reference ref = _storage.refFromURL(imageUrl);
        await ref.delete();
      } catch (e) {
        print('Error deleting image: $e');
      }
    }

    // Delete document from Firestore
    await _firestore.collection('properties').doc(propertyId).delete();
  }
}
