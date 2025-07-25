import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/opportunity_model.dart';

class LocalDataService {
  static Future<List<Opportunity>> loadOpportunities() async {
    try {
      final jsonString = await rootBundle.loadString(
        'lib/data/opportunities.json',
      );
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Opportunity.fromJson(json)).toList();
    } catch (e) {
      print('Error loading opportunities: $e');
      throw Exception('Failed to load opportunities: $e');
    }
  }

  // Alternative version with error handling
  static Future<List<Opportunity>> getOpportunities() async {
    try {
      final jsonString = await rootBundle.loadString(
        'lib/data/opportunities.json',
      );
      final data = await json.decode(jsonString);
      return (data as List).map((e) => Opportunity.fromJson(e)).toList();
    } catch (e) {
      print('Error in getOpportunities: $e');
      return [];
    }
  }
}
