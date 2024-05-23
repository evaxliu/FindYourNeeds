import 'dart:async';
import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/models/locations_db.dart';
import 'package:final_project_app/providers/position_provider.dart';
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
  // Timer
  late final Timer _locationGrabTimer;
  late double long;
  late double lat;

  // Initialize State
  @override
  initState(){
    super.initState();

    // final singleUsePositionProvider = Provider.of<PositionProvider>(context, listen: false);

    // long = singleUsePositionProvider.longitude;
    // lat = singleUsePositionProvider.latitude;

    // // Periodic Timer to run updating weather
    // _locationGrabTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
    //   long = singleUsePositionProvider.longitude;
    //   lat = singleUsePositionProvider.latitude; 
    // });
  }

  // Disposes timer when we don't need it
  // @override 
  // dispose(){
  //   _locationGrabTimer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            // Create Center -> Card -> Column widget to hold ListTile widgets
            return Center(
              child: Card(
                child: Column(
                  children: locationWidgets,
                ),
              ),
            );
          } else {
            // Display text if position isn't known
            return const LoadingWidget();
          }
        }
      ),
    );
  }
}