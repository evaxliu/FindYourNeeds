import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.locationWidgets,
  });

  final List<Widget> locationWidgets;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: locationWidgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}