import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'location.dart';

Future<List<Location>> loadLocations() async {
  final String response = await rootBundle.loadString('assets/locations.json');
  final data = json.decode(response) as List;
  return data.map((item) => Location.fromJson(item)).toList();
}
