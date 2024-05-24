import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wc),
              SizedBox(width: 8.0),
              Text('Toilets'),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.shower),
              SizedBox(width: 8.0),
              Text('Showers'),
            ],
          ),
          // Add more legend items as needed
        ],
      ),
    );
  }
}
