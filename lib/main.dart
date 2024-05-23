import 'package:final_project_app/models/locations_db.dart';
import 'package:final_project_app/providers/position_provider.dart';
import 'package:final_project_app/views/find_your_needs_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<LocationsDB> loadVenuesDB(String dataPath) async {
  return LocationsDB.initializeFromJson(await rootBundle.loadString(dataPath));
}

void main() {
  // Change this to the cvs file to obtain info
  const dataPath = 'assets/locations.json';
  WidgetsFlutterBinding.ensureInitialized();
  loadVenuesDB(dataPath).then((value) => runApp(
    ChangeNotifierProvider(
      create: (context) => PositionProvider(),
      child: FindYourNeedsApp(locations: value),
    ),
  ));
}