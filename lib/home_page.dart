import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FINDING\nYOUR\nNEEDS',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.family_restroom,
                  color: Colors.blue,
                  size: 40,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.bathtub,
                  color: Colors.purple,
                  size: 40,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.local_library,
                  color: Colors.orange,
                  size: 40,
                ),
                SizedBox(width: 20),
              Icon(
                Icons.food_bank,
                color: Colors.green,
                size: 40,
              ),
              ],
            ),
          //   const SizedBox(height: 40),
          //   ElevatedButton(
          //     onPressed: () {
          //       // Navigate to the next page (map page)
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => MapPage()),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.blue,
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 40,
          //         vertical: 16,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //     ),
          //     child: const Text(
          //       'START SEARCH',
          //       style: TextStyle(fontSize: 18),
          //     ),
          //   ),
          // ],
         ]),
      ),
    );
  }
}
