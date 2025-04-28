// import 'package:flutter/material.dart';
// import 'package:mazdoor/Screens/bookingscreen.dart';
//
// class BookingHistoryScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> bookingHistory = [
//     {
//       'laborer': 'Ali - Electrician',
//       'service': 'Fan Installation',
//       'date': '2025-04-10',
//       'time': '4:00 PM',
//       'location': 'Karachi, Block 2',
//       'status': 'Completed',
//     },
//     {
//       'laborer': 'Zahid - Plumber',
//       'service': 'Pipe Repair',
//       'date': '2025-04-12',
//       'time': '10:00 AM',
//       'location': 'Hyderabad, Latifabad',
//       'status': 'Upcoming',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Booking History')),
//       body: ListView.builder(
//         itemCount: bookingHistory.length,
//         itemBuilder: (context, index) {
//           final booking = bookingHistory[index];
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('${booking['laborer']}'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Service: ${booking['service']}'),
//                   Text('Date: ${booking['date']} at ${booking['time']}'),
//                   Text('Location: ${booking['location']}'),
//                   Text('Status: ${booking['status']}', style: TextStyle(color: booking['status'] == 'Upcoming' ? Colors.orange : Colors.green)),
//                 ],
//               ),
//               trailing: booking['status'] == 'Upcoming'
//                   ? ElevatedButton(
//                 onPressed: () {
//
//                 },
//                 child: Text('Cancel'),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               )
//                   : ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailView()));
//                   // rebook logic
//                 },
//                 child: Text('Rebook'),
//               ),
//               isThreeLine: true,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'booking_invoice_screen.dart';
import 'booking_rating_screen.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  final List<Map<String, String>> bookings = const [
    {
      'name': 'Ali Khan',
      'service': 'Electrician',
      'date': 'April 6, 2025',
      'time': '3:00 PM',
      'charges': '500',
      'status': 'Completed',
      'location': 'Karachi'
    },
    {
      'name': 'Zubair Ahmed',
      'service': 'Plumber',
      'date': 'April 2, 2025',
      'time': '11:00 AM',
      'charges': '700',
      'status': 'Cancelled',
      'location': 'Lahore'
    },
    {
      'name': 'Fahad Iqbal',
      'service': 'Carpenter',
      'date': 'March 28, 2025',
      'time': '9:30 AM',
      'charges': '600',
      'status': 'Completed',
      'location': 'Hyderabad'
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking History")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          final isCompleted = booking['status'] == 'Completed';

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text('${booking['name']} (${booking['service']})'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${booking['date']} • ${booking['time']}'),
                  const SizedBox(height: 4),
                  if (isCompleted)
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingRatingScreen(
                              workerName: booking['name']!,
                            ),
                          ),
                        );
                      },
                      child: const Text("Rate", style: TextStyle(fontSize: 14)),
                    ),
                ],
              ),
              trailing: Text(
                booking['status']!,
                style: TextStyle(
                  color: getStatusColor(booking['status']!),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // ✅ Navigate to Booking Invoice Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingInvoiceScreen(
                      booking: booking,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
