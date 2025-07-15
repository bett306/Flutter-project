import 'package:flutter/material.dart';
import '../models/opportunity_model.dart';
import '../services/local_data_service.dart';
import 'details_screen.dart';
import '../widgets/opportunity_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Opportunity> opportunities = [];

  @override
  void initState() {
    super.initState();
    loadOpportunities();
  }

  Future<void> loadOpportunities() async {
    final data = await LocalDataService.loadMockOpportunities();
    setState(() {
      opportunities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Youth Opportunity Hub')),
      body: opportunities.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: opportunities.length,
              itemBuilder: (context, index) {
                final opportunity = opportunities[index];
                return OpportunityCard(opportunity: opportunity);
              },
            ),
    );
  }
}
