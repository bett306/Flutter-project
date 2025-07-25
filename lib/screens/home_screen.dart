import 'package:flutter/material.dart';
import '../services/local_data_service.dart';
import '../models/opportunity_model.dart';
import 'details_screen.dart'; // Make sure this import exists

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Opportunity>> futureOpportunities;
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    futureOpportunities = LocalDataService.loadOpportunities();
  }

  List<String> _getCategories(List<Opportunity> opportunities) {
    final categories = opportunities.map((opp) => opp.type).toSet().toList();
    categories.insert(0, 'All');
    return categories;
  }

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
      appBar: AppBar(title: const Text('Opportunities')),
      body: FutureBuilder<List<Opportunity>>(
        future: futureOpportunities,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final opportunities = snapshot.data!;
          final categories = _getCategories(opportunities);

          return Column(
            children: [
              // Category filter chips
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? category : 'All';
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              // Opportunities list
              Expanded(
                child: ListView.builder(
                  itemCount: opportunities.length,
                  itemBuilder: (context, index) {
                    final opp = opportunities[index];
                    // Filter by selected category
                    if (_selectedCategory != 'All' &&
                        opp.type != _selectedCategory) {
                      return const SizedBox.shrink();
                    }
                    return Card(
                      child: ListTile(
                        title: Text(opp.title),
                        subtitle: Text(
                          '${opp.type} • Deadline: ${opp.deadline}',
                        ),
                        onTap: () => _navigateToDetails(
                          context,
                          opp,
                        ), // Added navigation
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
