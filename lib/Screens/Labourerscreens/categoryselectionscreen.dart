import 'package:flutter/cupertino.dart' show StatelessWidget;
import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/Labourerscreens/worklistscreen.dart';

class CategorySelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electrician', 'icon': Icons.electrical_services},
    {'name': 'Plumber', 'icon': Icons.plumbing},
    {'name': 'Carpenter', 'icon': Icons.chair},
    {'name': 'Painter', 'icon': Icons.format_paint},
    {'name': 'AC Mechanic', 'icon': Icons.ac_unit},
    {'name': 'Mason', 'icon': Icons.construction},
    {'name': 'Welder', 'icon': Icons.build},
    {'name': 'Cleaner', 'icon': Icons.cleaning_services},
    {'name': 'Gardener', 'icon': Icons.grass},
    {'name': 'Tailor', 'icon': Icons.cut},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Service")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                // Go to list of workers in this category
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerListScreen(categoryName:  category['name'])));
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category['icon'], size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(category['name'], style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
