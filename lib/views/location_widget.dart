import 'package:flutter/material.dart';
import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/providers/position_provider.dart';

class LocationWidget extends StatelessWidget {
  final Location location;
  final PositionProvider positionProvider;

  const LocationWidget({
    super.key,
    required this.location,
    required this.positionProvider
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Semantics(
            label: location.name,
            child: const Icon(Icons.bathroom)
          ),
          title: Text(location.name),
          subtitle: Text('Distance: ${location.distanceInMeters(latitude: positionProvider.latitude, longitude: positionProvider.longitude).roundToDouble().toString()} meters'),
          ),
      ],
    );
  }
}