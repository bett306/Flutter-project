import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/opportunity_model.dart';

class LocalDataService {
  static Future<List<Opportunity>> loadMockOpportunities() async {
    final String response = await rootBundle.loadString(
      'lib/data/opportunities.json',
    );
    final List<dynamic> data = json.decode(response);
    return Opportunity.fromList(data);
  }
}
