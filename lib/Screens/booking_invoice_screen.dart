import 'package:flutter/material.dart';

class BookingInvoiceScreen extends StatelessWidget {
  final Map<String, dynamic> booking;

  const BookingInvoiceScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final double serviceCharge = double.tryParse(booking['charges'].toString()) ?? 0;
    final double serviceFee = 50; // fixed fee or % based
    final double total = serviceCharge + serviceFee;

    return Scaffold(
      appBar: AppBar(title: const Text('Booking Invoice')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.receipt_long, size: 64, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),

            Text('Worker Name: ${booking['name']}', style: const TextStyle(fontSize: 18)),
            Text('Service: ${booking['service']}'),
            Text('Date: ${booking['date']}'),
            Text('Time: ${booking['time']}'),
            Text('Location: ${booking['location'] ?? 'N/A'}'),

            const Divider(height: 30),

            Text('Service Charges: PKR ${serviceCharge.toStringAsFixed(0)}'),
            Text('Service Fee: PKR ${serviceFee.toStringAsFixed(0)}'),

            const Divider(height: 30),
            Text('Total: PKR ${total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                // TODO: Export or share invoice
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invoice downloaded')),
                );
              },
              icon: const Icon(Icons.download),
              label: const Text('Download Invoice'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
            )
          ],
        ),
      ),
    );
  }
}
