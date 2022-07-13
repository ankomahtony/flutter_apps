import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String calText = "";
  String output = '';
  bool equalSign = false;
  List<String> signs = ["+","-","%","/", "x","^"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff22252D),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: size.height / 10,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: size.height / 15,
                      child:Text(
                        calText,
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20,
                        ),
                      ),

                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: size.height / 15,
                      child:Text(
                        output,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                        ),
                      ),

                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              Container(
                height: size.height / 1.5,
                decoration: const BoxDecoration(
                  color: Color(0xff2A2D36),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        blocks("AC",Colors.green),
                        blocks("CC",Colors.green),
                        blocks("%",Colors.green),
                        blocks("/",Colors.red)],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        blocks("7"),
                        blocks("8"),
                        blocks("9"),
                        blocks("x",Colors.red)
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        blocks("4"),
                        blocks("5"),
                        blocks("6"),
                        blocks("-",Colors.red)
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        blocks("1"),
                        blocks("2"),
                        blocks("3"),
                        blocks("+",Colors.red)
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        blocks("^"),
                        blocks("0"),
                        blocks("."),
                        blocks("=", equalSign? Colors.blue: Colors.red)
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),

        )
    );
  }

  Widget blocks(String text,[Color? color]){
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          if(text == 'AC'){
            calText ='';
            output = '';
            equalSign = false;
          }else if(text == 'CC'){
            if(calText.isNotEmpty){
              calText = calText.substring(0,calText.length - 1);
            }
          }
          else if(text == "="){
            output = calText.interpret().toString();
            calText = 'Ans:';
            equalSign = true;
          }
          else if(signs.contains(text)){

            if(equalSign){
              calText = output;
            }
            output = calText.interpret().toString();
            if(text == 'x'){
              calText += '*';
            }else {
              calText += text;
            }
            equalSign = false;
          }
          else{
            if(equalSign){
              calText = '';
            }
            calText += text;

            equalSign = false;
          }
        });
      },
      child: Padding(
          padding: EdgeInsets.only(top:size.height/40,right: size.width/40,left: size.width/40,),
          child: Container(
            height: size.height/10,
            width: size.width/5,
            decoration: const BoxDecoration(
              color: Color(0xff22252D),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: color??Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
      ),
    );
  }

}
