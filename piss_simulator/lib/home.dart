import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange,Colors.red],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Let's Pee",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                  "Save yourself from \nawkward situation",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: size.height / 2.5,
                    child: const Image(image: AssetImage("assets/funny.png"))
                ),
              ),
              SizedBox(
                height:size.height / 10,
              ),
              ElevatedButton(
                  onPressed: (){
                    final player = AudioCache();
                    player.play("pee.mp3");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      primary: Colors.orange, elevation: 5
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Play", style: TextStyle(fontSize:30),),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
