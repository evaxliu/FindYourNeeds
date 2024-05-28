import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/models/locations_db.dart';
import 'package:final_project_app/providers/position_provider.dart';
import 'package:final_project_app/views/header_widget.dart';
import 'package:final_project_app/views/loading_widget.dart';
import 'package:final_project_app/views/location_view.dart';
import 'package:final_project_app/views/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/map/map.dart';

class FindYourNeedsApp extends StatefulWidget {
  final LocationsDB locations;

  const FindYourNeedsApp({super.key, required this.locations});

  @override
  State<FindYourNeedsApp> createState() => _FindYourNeedsAppState();
}

class _FindYourNeedsAppState extends State<FindYourNeedsApp> {
  late double long;
  late double lat;

  // Initialize State
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FIND YOUR NEEDS',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          semanticsLabel: 'Find your needs',
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: MapScreen(), // showing the map on the top half
          ),
          Expanded(
            flex: 1,
            child: Consumer<PositionProvider>(
              builder: (context, positionProvider, child) {
                if (positionProvider.positionKnown) {
                  // Sort locations by nearest to furthest
                  List<Location> nearestLocations = widget.locations.nearestTo(
                    latitude: positionProvider.latitude,
                    longitude: positionProvider.longitude,
                  );
                  List<Widget> locationWidgets =
                      nearestLocations.map((location) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToLocationView(
                            context, location, positionProvider);
                      },
                      child: LocationWidget(
                        location: location,
                        positionProvider: positionProvider,
                      ),
                    );
                  }).toList();
                  return HeaderWidget(locationWidgets: locationWidgets);
                } else {
                  // Display text if position isn't known
                  return const LoadingWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// A method to navigate the user's UI to the given entry
// Params:
//  - context: BuildContext
//  - entry: JournalEntry
Future<void> _navigateToLocationView(BuildContext context, Location location,
    PositionProvider positionProvider) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationView(
              location: location, positionProvider: positionProvider)));

  if (!context.mounted) {
    return; // The widget may not be instantiated nor mounted yet or has been unmounted, may happen when app launches for the first time or was closed and then reopened, this prevents certain errors due to these cases.
  }
}
