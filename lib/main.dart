import 'package:final_project_app/models/locations_db.dart';
import 'package:final_project_app/providers/position_provider.dart';
import 'package:final_project_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<LocationsDB> loadLocationsDB(String dataPath) async {
  return LocationsDB.initializeFromJson(await rootBundle.loadString(dataPath));
}

void main() {
  const dataPath = 'assets/locations.json';
  WidgetsFlutterBinding.ensureInitialized();
  loadLocationsDB(dataPath).then((value) => runApp(
        ChangeNotifierProvider(
          create: (context) => PositionProvider(),
          child: MainApp(locations: value),
        ),
      ));
}

class MainApp extends StatelessWidget {
  final LocationsDB locations;

  const MainApp({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(locations: locations),
    );
  }
}
