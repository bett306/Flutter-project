import 'package:flutter/material.dart';
import '../models/opportunity_model.dart';
import '../screens/details_screen.dart';

class OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;
  const OpportunityCard({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(opportunity.title),
        subtitle: Text(
          '${opportunity.type} • Deadline: ${opportunity.deadline}',
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsScreen(opportunity: opportunity),
            ),
          );
        },
      ),
    );
  }
}
