import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Loading Current Location',
        style: TextStyle(
          color: Color.fromARGB(255, 24, 114, 21),
          decoration: TextDecoration.none,
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
        semanticsLabel: 'Loading Current Location',
      )
    );
  }
}
