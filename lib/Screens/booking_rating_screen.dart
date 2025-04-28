import 'package:flutter/material.dart';

class BookingRatingScreen extends StatefulWidget {
  final String workerName;

  const BookingRatingScreen({super.key, required this.workerName});

  @override
  State<BookingRatingScreen> createState() => _BookingRatingScreenState();
}

class _BookingRatingScreenState extends State<BookingRatingScreen> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _submitRating() {
    if (_rating == 0 || _reviewController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide a rating and review")),
      );
      return;
    }

    // TODO: Save rating and review to backend or database
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Thank you for your feedback!")),
    );

    Navigator.pop(context); // Back to previous screen
  }

  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        Icons.star,
        color: _rating > index ? Colors.amber : Colors.grey,
        size: 32,
      ),
      onPressed: () => setState(() => _rating = index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate Service")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Rate your experience with ${widget.workerName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, _buildStar),
            ),

            const SizedBox(height: 20),

            // Review box
            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Write your review",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _submitRating,
              child: const Text("Submit Review"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            )
          ],
        ),
      ),
    );
  }
}
