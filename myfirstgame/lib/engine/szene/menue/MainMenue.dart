


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/szene/menue/GameMenue.dart';

class MainMenue extends StatelessWidget{

  const MainMenue ({Key? key}) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (body: Center(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical:  50.0), child: Text("My Game"),),
          ElevatedButton(
              onPressed:  (){
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const GamePlay(),
                ),
              );
          },
              child: Text("Play")

          ),
          ElevatedButton(onPressed: exitgame(), child: Text("Exit"))
         ]
        ,)
      ,)
      ,);
  }

  exitgame() {}


  
}