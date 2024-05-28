import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
            Semantics(
                label: 'Current Location',
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(width: 4.0),
              const Text('Current Location', semanticsLabel: 'Current Location'),
            ],
          ),
          Row(
            children: [
            Semantics(
                label: 'Restroom',
                child: const Icon(
                  Icons.family_restroom,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              const SizedBox(width: 4.0),
              const Text('Restroom', semanticsLabel: 'Restroom'),
            ],
          ),
          Row(
            children: [
              Semantics(
                  label: 'General Hygiene',
                  child: const Icon(
                    Icons.bathtub,
                    color: Colors.purple,
                    size: 40,
                  ),
              ),
              const SizedBox(width: 4.0),
              const Text('General Hygiene', semanticsLabel: 'General Hygiene'),
            ],
          ),
          Row(
            children: [
              Semantics(
                label: 'Library',
                child: const Icon(
                  Icons.local_library,
                  color: Colors.orange,
                  size: 40,
                ),
              ),
              const SizedBox(width: 4.0),
              const Text('Library', semanticsLabel: 'Library'),
            ],
          ),
          Row(
            children: [
              Semantics(
                label: 'Food Bank',
                child: const Icon(
                  Icons.food_bank,
                  color: Colors.green,
                  size: 40,
                )
              ),
              const SizedBox(width: 4.0),
              const Text('Food Bank', semanticsLabel: 'Food Bank'),
            ],
          ),
        ],
      ),
    );
  }
}
