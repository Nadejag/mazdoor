// models/labour_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Labor {
  final String id;
  final String name;
  final List<String> skills;
  final String profileImage;
  final double rating;
  final double distance;
  final GeoPoint location;

  Labor({
    required this.id,
    required this.name,
    required this.skills,
    required this.profileImage,
    required this.rating,
    required this.distance,
    required this.location,
  });
}