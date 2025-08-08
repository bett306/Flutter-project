import 'package:flutter/material.dart';
import '../models/opportunity_model.dart';
import 'details_screen.dart';

class SavedOptionsScreen extends StatelessWidget {
  final List<Opportunity> bookmarkedItems;

  const SavedOptionsScreen({super.key, required this.bookmarkedItems});

  void _navigateToDetails(BuildContext context, Opportunity opportunity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(opportunity: opportunity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Opportunities')),
      body: bookmarkedItems.isEmpty
          ? const Center(child: Text('No saved opportunities yet.'))
          : ListView.builder(
              itemCount: bookmarkedItems.length,
              itemBuilder: (context, index) {
                final opp = bookmarkedItems[index];
                return Card(
                  child: ListTile(
                    title: Text(opp.title),
                    subtitle: Text('${opp.type} • Deadline: ${opp.deadline}'),
                    onTap: () => _navigateToDetails(context, opp),
                  ),
                );
              },
            ),
    );
  }
}
