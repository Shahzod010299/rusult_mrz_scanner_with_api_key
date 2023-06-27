import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EASYBOOKING',
          style: TextStyle(fontSize: 34, color: Colors.blueAccent),
        )
      ],
    ));
  }
}
