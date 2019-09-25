import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(
          "QuizStar",
          style: TextStyle(
            fontSize: 60.0,
          ),
        ),
      ),
    );
  }
}
