import 'package:flutter/material.dart';
import '../models/opportunity_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Opportunity opportunity;
  const DetailsScreen({super.key, required this.opportunity});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(opportunity.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              opportunity.type,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Deadline: ${opportunity.deadline}"),
            const SizedBox(height: 16),
            Text(opportunity.description),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _launchURL(opportunity.applyLink),
              child: const Text("Apply Now"),
            ),
          ],
        ),
      ),
    );
  }
}
