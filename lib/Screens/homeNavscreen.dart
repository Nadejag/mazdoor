// import 'package:flutter/material.dart';
// import 'package:mazdoor/Screens/profilescreen.dart';
// import 'package:mazdoor/Screens/searchscreen.dart';
// import 'package:mazdoor/Screens/settingsscreen.dart';
//
// import 'Labourerscreens/categoryselectionscreen.dart';
// import 'Labourerscreens/workereditprofilescreen.dart';
// import 'bookinghistoryscreen.dart';
// import 'bookingscreen.dart';
// import 'messagescreen.dart';
// import 'myjobscreen.dart';
// import 'notificationscreen.dart';
//
// class HomeScreen extends StatelessWidget {
//   final List<Map<String, String>> services = [
//     {'title': 'Plumber', 'icon': '🚰'},
//     {'title': 'Electrician', 'icon': '⚡'},
//     {'title': 'Carpenter', 'icon': '🪚'},
//     {'title': 'Painter', 'icon': '🎨'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         // leading: TextButton(
//         //   // child: Text('≡', style: TextStyle(fontSize: 24, color: Colors.black)),
//         //   onPressed: () {
//         //     Scaffold.of(context).openDrawer();
//         //   },
//         // ),
//         title: Text(
//           'Mazdoor',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EnhancedNotificationsScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SearchScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//
//       // Add Drawer
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             // Header Section
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/images/user_profile.jpg'), // Replace with your image asset
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "John Doe", // Replace with dynamic user name
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "johndoe@example.com", // Replace with dynamic email
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Menu Items
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.work),
//               title: Text('My Jobs'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyJobsScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.message),
//               title: Text('Messages'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MessagesScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text('MyBooking'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyBookingsScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Profile'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => WorkerEditProfileScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 _showLogoutDialog(context);
//               },
//             ),
//           ],
//         ),
//       ),
//
//       body:
//       Padding(
//         padding: const EdgeInsets.only(left:3,right: 20 ),
//         child: Column(
//           children: [
//             Text(
//               "Find a Laborer",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 20),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Builder(
//                   builder: (context) {
//                     return InkWell(
//                       onTap: (){
//                         Scaffold.of(context).openDrawer();
//                       },
//                       child: Container(
//                             child: Icon(Icons.arrow_forward_ios_sharp),
//                       ),
//                     );
//                     //   ElevatedButton(
//                     //   onPressed: () {
//                     //     Scaffold.of(context).openDrawer(); // Works now
//                     //   },
//                     //   child: Icon(),
//                     // );
//                   },
//                 ),
//
//                 Expanded(
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                     ),
//                     itemCount: services.length,
//                     itemBuilder: (context, index) {
//                       return ServiceTile(
//                         icon: services[index]['icon']!,
//                         label: services[index]['title']!,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
//                 );
//               },
//               child: Text('View All Bookings'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Logout Dialog
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Logout"),
//           content: Text("Are you sure you want to logout?"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//               },
//               child: Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//                 // Perform logout action here
//                 print("User logged out");
//               },
//               child: Text("Yes"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class ServiceTile extends StatelessWidget {
//   final String icon;
//   final String label;
//
//   const ServiceTile({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CategorySelectionScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               icon,
//               style: TextStyle(fontSize: 40),
//             ),
//             SizedBox(height: 8),
//             Text(
//               label,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class MyBookingsScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> bookings = [
//     {
//       'workerName': 'Ali Electrician',
//       'date': '2025-04-08',
//       'time': '3:00 PM',
//       'status': 'Upcoming',
//       'category': 'Electrician'
//     },
//     {
//       'workerName': 'Rashid Plumber',
//       'date': '2025-04-03',
//       'time': '12:00 PM',
//       'status': 'Completed',
//       'category': 'Plumber'
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("My Bookings")),
//       body: ListView.builder(
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final booking = bookings[index];
//           return Card(
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: ListTile(
//               title: Text(booking['workerName']),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Category: ${booking['category']}"),
//                   Text("Date: ${booking['date']}"),
//                   Text("Time: ${booking['time']}"),
//                   Text("Status: ${booking['status']}"),
//                 ],
//               ),
//               trailing: Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 // Navigate to booking detail screen (optional)
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//  }