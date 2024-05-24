import 'package:flutter/material.dart';
import 'legend/legend.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legend Widget Test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Legend Widget Test'),
        ),
        body: const Center(
          child: LegendWidget(),
        ),
      ),
    );
  }
}
