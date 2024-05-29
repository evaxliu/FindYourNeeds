import 'package:flutter/material.dart';
import 'find_your_needs_app.dart';
import 'package:final_project_app/models/locations_db.dart';

class HomePage extends StatelessWidget {
  final LocationsDB locations;

  const HomePage({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FINDING\nYOUR\nNEEDS',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              semanticsLabel: 'Finding Your Needs',
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Semantics(
                  label: 'Current Location',
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Semantics(
                  label: 'Restroom',
                  child: const Icon(
                    Icons.family_restroom,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Semantics(
                  label: 'General Hygiene',
                  child: const Icon(
                    Icons.bathtub,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Semantics(
                  label: 'Library',
                  child: const Icon(
                    Icons.local_library,
                    color: Colors.orange,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Semantics(
                  label: 'Food Bank',
                  child: const Icon(
                    Icons.food_bank,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to the next page (map page)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FindYourNeedsApp(locations: locations),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
                label: const Text(
                  'START SEARCH',
                  style: TextStyle(fontSize: 18),
                  semanticsLabel: 'Start Search',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(200, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
