import 'package:flutter/material.dart';
import 'package:flutter_basics/home.dart';

void main() {
  runApp(const PractiseApp());
}

class PractiseApp extends StatelessWidget {
  const PractiseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "First App",
      home: HomePage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            width: 120,
            color: Colors.red,
          ),
          Container(
            height: 100,
            width: 120,
            color: Colors.yellow,
            child:Icon(Icons.star, size: 70,)
          ),
          Container(
            height: 100,
            width: 120,
            color: Colors.green,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print("button pressed");},
      child: const Icon(Icons.access_alarm_outlined)
      ),
    );
  }
}

