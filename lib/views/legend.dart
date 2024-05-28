import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_pin, color: Colors.red),
              SizedBox(width: 8.0),
              Text('Current Location'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.family_restroom, color: Colors.blue),
              SizedBox(width: 8.0),
              Text('Restroom'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.bathtub, color: Colors.purple),
              SizedBox(width: 8.0),
              Text('General Hygiene'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.local_library, color: Colors.orange),
              SizedBox(width: 8.0),
              Text('Library'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.food_bank, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Food Bank'),
            ],
          ),
        ],
      ),
    );
  }
}
