import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'homeNavscreen.dart';

class BookingConfirmationScreentwo extends StatefulWidget {
  final Map<String, dynamic> worker;

  BookingConfirmationScreentwo({required this.worker});

  @override
  _BookingConfirmationScreentwoState createState() => _BookingConfirmationScreentwoState();
}

class _BookingConfirmationScreentwoState extends State<BookingConfirmationScreentwo> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Booking with ${widget.worker['name']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Your Name"),
                validator: (val) => val!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: "Service Address"),
                validator: (val) => val!.isEmpty ? "Enter address" : null,
              ),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(labelText: "Contact Number"),
                keyboardType: TextInputType.phone,
                validator: (val) => val!.isEmpty ? "Enter contact number" : null,
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(selectedDate == null
                    ? "Select Date"
                    : "Date: ${selectedDate!.toLocal()}".split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => selectedDate = picked);
                  }
                },
              ),
              ListTile(
                title: Text(selectedTime == null
                    ? "Select Time"
                    : "Time: ${selectedTime!.format(context)}"),
                trailing: Icon(Icons.access_time),
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() => selectedTime = picked);
                  }
                },
              ),
              TextFormField(
                controller: notesController,
                decoration: InputDecoration(labelText: "Additional Notes"),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text("Confirm Booking"),
                onPressed: () {
                  if (_formKey.currentState!.validate() && selectedDate != null && selectedTime != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingSuccessScreen(workerName: '',)));
                    // Save booking
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Booking Confirmed!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields")),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
class BookingSuccessScreen extends StatelessWidget {
  final String workerName;

  BookingSuccessScreen({required this.workerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 20),
              Text("Booking Confirmed!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("You have successfully booked $workerName."),
              Text("The worker will contact you shortly."),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                },
                child: Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
