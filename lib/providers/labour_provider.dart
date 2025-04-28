// providers/labor_provider.dart
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

  // Add this import
import '../models/labour_model.dart';   // Make sure this import is correct
class Category {
  final String id;
  final String name;
  final IconData icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}
class LaborProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Category> _categories = [];
  List<Labor> _labors = [];

  List<Category> get categories => _categories;
  List<Labor> get labors => _labors;

  Future<void> fetchCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      _categories = snapshot.docs.map((doc) => Category(
        id: doc.id,
        name: doc['name'],
        icon: _getIconData(doc['icon']),
      )).toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<List<Labor>> getLaborsByCategory(String categoryId) async {
    try {
      final snapshot = await _firestore
          .collection('labors')
          .where('category', isEqualTo: categoryId)
          .where('isAvailable', isEqualTo: true)
          .get();

      return snapshot.docs.map((doc) => Labor(
        id: doc.id,
        name: doc['name'],
        skills: List<String>.from(doc['skills']),
        profileImage: doc['profileImage'],
        rating: doc['rating'].toDouble(),
        distance: 0.0,
        location: doc['location'],
      )).toList();
    } catch (error) {
      throw error;
    }
  }

  Future<List<Labor>> getLaborsNearLocation({
    required String category,
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    try {
      final snapshot = await _firestore
          .collection('labors')
          .where('category', isEqualTo: category)
          .where('isAvailable', isEqualTo: true)
          .get();

      List<Labor> nearbyLabors = [];

      for (var doc in snapshot.docs) {
        GeoPoint laborLocation = doc['location'];
        double distanceInKm = Geolocator.distanceBetween(
          latitude,
          longitude,
          laborLocation.latitude,
          laborLocation.longitude,
        ) / 1000;

        if (distanceInKm <= radius) {
          nearbyLabors.add(Labor(
            id: doc.id,
            name: doc['name'],
            skills: List<String>.from(doc['skills']),
            profileImage: doc['profileImage'],
            rating: doc['rating'].toDouble(),
            distance: distanceInKm,
            location: laborLocation,
          ));
        }
      }

      nearbyLabors.sort((a, b) => a.distance.compareTo(b.distance));
      return nearbyLabors;
    } catch (error) {
      throw error;
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'plumber': return Icons.plumbing;
      case 'electrician': return Icons.electrical_services;
      case 'carpenter': return Icons.carpenter;
      case 'painter': return Icons.format_paint;
      case 'cleaner': return Icons.cleaning_services;
      case 'mechanic': return Icons.car_repair;
      default: return Icons.work;
    }
  }
}