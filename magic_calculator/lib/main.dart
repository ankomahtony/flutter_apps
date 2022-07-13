import 'package:flutter/material.dart';
import 'package:magic_calculator/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Magic Calculator',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
