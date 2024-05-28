import 'package:flutter/material.dart';
import 'package:final_project_app/models/location.dart';
import 'package:final_project_app/providers/position_provider.dart';

class LocationView extends StatelessWidget {
  final Location location;
  final PositionProvider positionProvider;

  const LocationView({
    super.key,
    required this.location,
    required this.positionProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(label: 'More Info', child: const Text('More Info')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _locationInformation('Location Name', location.name),
            _locationInformation('Type', location.type),
            _locationInformation('Address', location.address),
            _locationInformation('Distance', '${location.distanceInMeters(
      latitude: positionProvider.latitude,
      longitude: positionProvider.longitude,
    ).roundToDouble().toString()} meters away'),
            _locationInformation('Available to', location.population),
            _locationInformation('Laundry Available', location.laundry),
            _locationInformation('Portable Toilet Available', location.portableToilet),
            _locationInformation('Restroom Available', location.restrooms),
            _locationInformation('Showers Available', location.showers),
          ],
        ),
      ),
    );
  }

  Widget _locationInformation(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Semantics(
        label: '$title: $info',
        value: info,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Expanded(
              child: Text(info, style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}