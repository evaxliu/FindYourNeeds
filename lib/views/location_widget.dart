import 'package:flutter/material.dart';
import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/providers/position_provider.dart';

class LocationWidget extends StatelessWidget {
  final Location location;
  final PositionProvider positionProvider;

  const LocationWidget({
    super.key,
    required this.location,
    required this.positionProvider,
  });

  @override
  Widget build(BuildContext context) {
    Semantics widgetIcon = Semantics(label: 'Unknown', child: const Icon(Icons.question_mark));
    switch(location.type) {
      case 'Restroom':
        widgetIcon = Semantics(label: 'Restroom available at location', child: const Icon(Icons.family_restroom));
        break;
      case 'General Hygiene':
        widgetIcon = Semantics(label: 'General hygiene stations available at location. Example: Shower, Restrooms and Laundry', child: const Icon(Icons.bathtub));
        break;
      case 'Library':
        widgetIcon = Semantics(label: 'Library', child: const Icon(Icons.local_library));
        break;
      case 'Food Bank':
        widgetIcon = Semantics(label: 'Food Bank', child: const Icon(Icons.food_bank));
        break;
    }
    return Column(
      children: <Widget>[
        ListTile(
          leading: Semantics(
            label: location.name,
            child: widgetIcon
          ),
          title: Text(location.name),
          subtitle: Text(location.type),
          trailing: Text('${location.distanceInMeters(latitude: positionProvider.latitude, longitude: positionProvider.longitude).roundToDouble().toString()} meters'),
        ),
      ],
    );
  }
}