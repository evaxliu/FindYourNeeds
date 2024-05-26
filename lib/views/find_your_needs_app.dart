import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/models/locations_db.dart';
import 'package:final_project_app/providers/position_provider.dart';
import 'package:final_project_app/views/header_widget.dart';
import 'package:final_project_app/views/loading_widget.dart';
import 'package:final_project_app/views/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<PositionProvider>( 
              builder: (context, positionProvider, child) {
                if(positionProvider.positionKnown) {
                  // Sort venues by nearest to furthest
                  List<Location> nearestLocations = widget.locations.nearestTo(latitude: positionProvider.latitude, longitude: positionProvider.longitude);
                  // Create individual Column -> ListTile widgets to display restaurant info
                  List<Widget> locationWidgets = nearestLocations.map((location) {
                    return LocationWidget(
                      location: location,
                      positionProvider: positionProvider,
                    );
                  }).toList();
                  return HeaderWidget(locationWidgets: locationWidgets);
                } else {
                  // Display text if position isn't known
                  return const LoadingWidget();
                }
              }
            ),
          )
        )
      )
    );
  }
}