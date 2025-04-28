import 'package:flutter/material.dart';

class WalletEarningsScreen extends StatelessWidget {
  const WalletEarningsScreen({super.key});

  final double totalEarnings = 12500;
  final double availableBalance = 8500;
  final double pendingBalance = 4000;

  final List<Map<String, String>> transactions = const [
    {
      'title': 'Job: Plumbing',
      'amount': '2000',
      'date': 'April 6, 2025',
    },
    {
      'title': 'Job: Electrical Fix',
      'amount': '1500',
      'date': 'April 4, 2025',
    },
    {
      'title': 'Job: Furniture Repair',
      'amount': '3000',
      'date': 'March 29, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallet & Earnings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Earnings: PKR $totalEarnings",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Available to Withdraw: PKR $availableBalance"),
                    Text("Pending Payments: PKR $pendingBalance"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Withdrawal Button
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Handle withdrawal logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Withdrawal request submitted")),
                );
              },
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text("Request Withdrawal"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
            ),

            const SizedBox(height: 30),

            const Text("Transaction History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // List of transactions
            ...transactions.map((tx) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: Text(tx['title']!),
                  subtitle: Text(tx['date']!),
                  trailing: Text('PKR ${tx['amount']}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
