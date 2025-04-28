import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Change Profile Picture",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text("Name", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
            SizedBox(height: 20),
            Text("Phone", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(hintText: 'Enter your phone number'),
            ),
            SizedBox(height: 20),
            Text("Email", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Enter your email'),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle saving the edited profile
                  },
                  child: Text('Save Changes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle canceling the edit
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
