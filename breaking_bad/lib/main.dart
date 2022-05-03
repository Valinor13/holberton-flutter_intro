import 'package:flutter/material.dart';
import 'package:breaking_bad/home_screen.dart';

// main - calls the app entry point which will render to the mobile screen
// returns: void
void main() {
  runApp(const MyApp());
}

// MyApp - class that renders to screen
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
