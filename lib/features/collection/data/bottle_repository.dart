import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import '../model/bottle.dart';

class BottleRepository {
  Future<List<Bottle>> loadBottles() async {
    // ✅ Check internet connection first
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      throw Exception('No internet connection. Cannot load data.');
    }

    try {
      final data = await rootBundle.loadString('assets/data/mock_bottles.json');
      final List<dynamic> jsonResult = json.decode(data);
      return jsonResult.map((e) => Bottle.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load bottles');
    }
  }
}
