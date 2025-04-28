import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WorkerEditProfileScreen extends StatefulWidget {
  const WorkerEditProfileScreen({super.key});

  @override
  State<WorkerEditProfileScreen> createState() => _WorkerEditProfileScreenState();
}

class _WorkerEditProfileScreenState extends State<WorkerEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = 'Ali Khan';
  String skills = 'Electrician, Wiring, Maintenance';
  String bio = '5+ years experience in residential and commercial work.';
  String rate = '500';
  bool isAvailable = true;
  File? profileImage;
  List<File> galleryImages = [];

  final picker = ImagePicker();

  Future<void> _pickProfileImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  Future<void> _pickGalleryImages() async {
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        galleryImages = picked.map((e) => File(e.path)).toList();
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile to backend or local storage
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Image
              GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage!)
                      : const NetworkImage('https://randomuser.me/api/portraits/men/1.jpg') as ImageProvider,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Tap image to change profile picture"),
              const SizedBox(height: 20),

              // Name
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Name required' : null,
                onChanged: (value) => name = value,
              ),

              // Skills
              TextFormField(
                initialValue: skills,
                decoration: const InputDecoration(labelText: 'Skills (comma separated)'),
                validator: (value) => value!.isEmpty ? 'Skills required' : null,
                onChanged: (value) => skills = value,
              ),

              // Rate
              TextFormField(
                initialValue: rate,
                decoration: const InputDecoration(labelText: 'Rate per hour (PKR)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Rate required' : null,
                onChanged: (value) => rate = value,
              ),

              // Bio
              TextFormField(
                initialValue: bio,
                decoration: const InputDecoration(labelText: 'About you'),
                maxLines: 3,
                onChanged: (value) => bio = value,
              ),

              // Availability
              SwitchListTile(
                title: const Text('Available'),
                value: isAvailable,
                onChanged: (value) => setState(() => isAvailable = value),
              ),

              // Gallery Picker
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _pickGalleryImages,
                icon: const Icon(Icons.photo_library),
                label: const Text('Upload Work Gallery'),
              ),
              const SizedBox(height: 10),
              galleryImages.isNotEmpty
                  ? Wrap(
                spacing: 10,
                children: galleryImages
                    .map((img) => Image.file(img, width: 80, height: 80, fit: BoxFit.cover))
                    .toList(),
              )
                  : const Text('No gallery images uploaded'),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
