import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/wallet_earning_screen.dart';
import 'Labourerscreens/workerstatustogglescreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // General Settings (future use)
            ListTile(
              title: const Text('General Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // TODO: Navigate to general settings screen
              },
            ),
            ListTile(
              title: Text('Account Settings'),
              leading: Icon(Icons.account_circle),
              onTap: () {
                // Navigate to account settings
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerStatusToggleScreen()));
              },
            ),
            // Account Settings (now opens status toggle screen)
            ListTile(
              title: const Text('Availability Status'),
              leading: const Icon(Icons.toggle_on),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkerStatusToggleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My Wallet'),
              leading: const Icon(Icons.wallet),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WalletEarningsScreen()),
                );
              },
            ),

            // Help & Support
            ListTile(
              title: const Text('Help and Support'),
              leading: const Icon(Icons.help),
              onTap: () {
                // TODO: Navigate to Help and Support
              },
            ),

            // Privacy
            ListTile(
              title: const Text('Privacy Policy'),
              leading: const Icon(Icons.security),
              onTap: () {
                // TODO: Show privacy policy
              },
            ),

            // Terms
            ListTile(
              title: const Text('Terms of Service'),
              leading: const Icon(Icons.library_books),
              onTap: () {
                // TODO: Show terms
              },
            ),

            // Logout
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                // TODO: Implement logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
