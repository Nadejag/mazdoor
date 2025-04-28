// labor_list_screen.dart
import 'package:flutter/material.dart';
import 'package:mazdoor/providers/labour_provider.dart';
import 'package:provider/provider.dart';

import 'labourcard.dart';
import 'labourdetailedclass.dart';
import 'models/categories_model.dart';
import 'models/labour_model.dart';
import 'nearbyscreen.dart';


class LaborListScreen extends StatefulWidget {
  final Category category;

  const LaborListScreen({Key? key, required this.category}) : super(key: key);

  @override
  _LaborListScreenState createState() => _LaborListScreenState();
}

class _LaborListScreenState extends State<LaborListScreen> {
  bool _isLoading = false;
  List<Labor> _labors = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadLabors();
  }

  Future<void> _loadLabors() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final laborProvider = Provider.of<LaborProvider>(context, listen: false);
      final labors = await laborProvider.getLaborsByCategory(widget.category.id);

      setState(() {
        _labors = labors;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load labors: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredLabors = _searchQuery.isEmpty
        ? _labors
        : _labors.where((labor) =>
    labor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        labor.skills.any((skill) =>
            skill.toLowerCase().contains(_searchQuery.toLowerCase()))).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: LaborSearchDelegate(_labors),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : filteredLabors.isEmpty
          ? Center(child: Text('No labors available in this category'))
          : RefreshIndicator(
        onRefresh: _loadLabors,
        child: ListView.builder(
          itemCount: filteredLabors.length,
          itemBuilder: (ctx, i) => LaborCard(labor: filteredLabors[i]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Scan nearby',
        child: Icon(Icons.qr_code_scanner),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => NearbyLaborsScreen(category: widget.category),
            ),
          );
        },
      ),
    );
  }
}

// Search delegate for labor search
class LaborSearchDelegate extends SearchDelegate {
  final List<Labor> labors;

  LaborSearchDelegate(this.labors);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = labors.where((labor) =>
    labor.name.toLowerCase().contains(query.toLowerCase()) ||
        labor.skills.any((skill) =>
            skill.toLowerCase().contains(query.toLowerCase()))).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return LaborCard(labor: results[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? labors
        : labors.where((labor) =>
    labor.name.toLowerCase().contains(query.toLowerCase()) ||
        labor.skills.any((skill) =>
            skill.toLowerCase().contains(query.toLowerCase()))).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(suggestionList[index].profileImage),
          ),
          title: Text(suggestionList[index].name),
          subtitle: Text(suggestionList[index].skills.join(', ')),
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => LaborDetailScreen(labor: suggestionList[index]),
              ),
            );
          },
        );
      },
    );
  }
}