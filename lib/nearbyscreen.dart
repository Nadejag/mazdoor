// nearby_labors_screen.dart
import 'package:flutter/material.dart';
import 'package:mazdoor/providers/labour_provider.dart';
import 'package:provider/provider.dart';

import 'package:geolocator/geolocator.dart';

import 'labourcard.dart';
import 'models/categories_model.dart';
import 'models/labour_model.dart';

class NearbyLaborsScreen extends StatefulWidget {
  final Category category;

  NearbyLaborsScreen({required this.category});

  @override
  _NearbyLaborsScreenState createState() => _NearbyLaborsScreenState();
}

class _NearbyLaborsScreenState extends State<NearbyLaborsScreen> {
  Position? _currentPosition;
  List<Labor> _nearbyLabors = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle location services disabled
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle permissions
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });

    _fetchNearbyLabors();
  }

  Future<void> _fetchNearbyLabors() async {
    final laborProvider = Provider.of<LaborProvider>(context, listen: false);

    // Get labors within 10km radius
    _nearbyLabors = await laborProvider.getLaborsNearLocation(
      category: widget.category.id,
      latitude: _currentPosition!.latitude,
      longitude: _currentPosition!.longitude,
      radius: 10.0, // in km
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby ${widget.category.name}'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _nearbyLabors.isEmpty
          ? Center(child: Text('No labors available nearby'))
          : ListView.builder(
        itemCount: _nearbyLabors.length,
        itemBuilder: (ctx, i) => LaborCard(labor: _nearbyLabors[i]),
      ),
    );
  }
}