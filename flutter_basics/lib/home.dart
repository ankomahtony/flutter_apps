import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Text(
            "$count",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            count++;
          });
        },
          child: const Icon(Icons.plus_one)
      ),
    );
  }
}
