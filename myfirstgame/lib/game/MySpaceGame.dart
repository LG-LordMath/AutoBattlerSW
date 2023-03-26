
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackgroundElements.dart';
import 'package:myfirstgame/engine/szene/menue/LoadingScreen.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/LosingScreen.dart';

import '../engine/szene/background/Background.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection, HasDraggableComponents, HasTappables {


  bool _fight = false;
  int _hpPlayer1 = 1;
  int _hpPlayer2 = 10;
  late GameTimer timer;


  final double charactersize = 100;
  late BasicShip base;
  late BasicShip base1;
  late BasicShip base2;
  late BasicShip base4;
  late BasicShip base5;
  late LoadingScreen loadingScreen;
  List<BasicShip> team1 = [];
  List<BasicShip> team2 = [];

  late Background background;

  final style = TextStyle(color:  BasicPalette.white.color);

  late TextComponent timmerview;


  @override
  Future<void> onLoad() async

  {

    await super.onLoad();
    loadingScreen = LoadingScreen();
    add(loadingScreen);



      final screenwidth = size[0];
      final screenheight = size[1];



      /*
     add(
        TimerComponent(
          period: 10,
          repeat: true,
          onTick: () => print('10 seconds elapsed'),
        )
    );
     */
    timer = GameTimer(Vector2(0,0) ,period: 15);
    final regular = TextPaint(style: style);
    timmerview = TextComponent();
    timmerview.text = timer.timer.current.toString();
    timmerview.position = Vector2(size[0] / 2, 20);
    if(loadingScreen.finishloading)
    {
      laodBackground();
      loadUI();
      loadShips();
      print("laod assets, screen: x" + size[1].toString() + ", y "+size[0].toString() );


    }

  }


  @override
  void update(double dt){
    super.update(dt);
    //print(loadingScreen.finishloading);
    if(loadingScreen.finishloading)
    {
      if(checkWon()){

      }
      else
      {
        if(_fight){
          fighting();
        }else{

          int temptimer = (15- timer.timer.current.toInt());
         // print( (15 - timer.timer.current.toInt()).toString() + " " + timer.timer.current.toInt().toString() );
          timmerview.text = (temptimer.toString());
          if(timer.timer.finished){
            loadShips();


          }else{
          }
        }
      }
    }

  }



  void laodBackground() {
    add(ScreenHitbox());
    background = Background();
    background.setSizes(size[0].toInt(), size[1].toInt());
    add(background );

    background.addingAnimatedBackgroundElement
      (EnumGlobalsBackgroundElements.AnimatedElementBlackHole1);
    background.addingAnimatedBackgroundElement
      (EnumGlobalsBackgroundElements.AnimatedElementBlackHole1);
  }

  void loadUI()
  {
    add(timmerview);
    add(timer);
  }

  bool checkWon()
  {
      if(_hpPlayer1<=0 || _hpPlayer1<=0){
        if(_hpPlayer1 <= 0){
          LosingScreen losing = LosingScreen();
          add(losing);
        }

        return true;
      }
      return false;
  }


  void fighting()
  {
    if(team1.isEmpty || team2.isEmpty){
      if(team2.isNotEmpty){
        team2.forEach((BasicShip ship) { ship.fighting(false);  ship.removeFromParent();});
        _fight = false; _hpPlayer1-=1;timer.timer.start();
      }
      if(team1.isNotEmpty){
        team1.forEach((BasicShip ship) { ship.fighting(false); ship.removeFromParent();});
        _fight = false; _hpPlayer2-=1;timer.timer.start();
      }
    }

  }

  void loadShips()
  {

    if(!_fight){
      base = BasicShip(0, 'ships/normal/other/AlienShip1.png', 200, 10, 50, 50, 200, 0, 1);
      base1 = BasicShip(0, 'ships/normal/other/AlienShip1.png', 200, 400, 100, 100, 800, 200, 2);
      base2 = BasicShip(1, 'ships/normal/other/AlienShip1.png', 50, 400, 100, 100, 100, 100, 2);
      base4 = BasicShip(1, 'ships/normal/other/AlienShip1.png', 50, 10, 50, 50, 200, 00, 1);
      team1.add(base);
      team1.add(base4);
      team2.add(base1);
      team2.add(base2);

      add(base);
      add(base1);
      add(base2);
      add(base4);
      beginnfight();
    }

  }

  void beginnfight()
  {
    team1.forEach((BasicShip ship) { ship.fighting(true);});
    team2.forEach((BasicShip ship) { ship.fighting(true);});
    _fight = true;

  }




  void removeAllComponents()
  {
    remove(background);
    remove(timmerview);
    remove(timer);

    remove(loadingScreen);
    _hpPlayer1 = 10;
    _hpPlayer2 = 10;

  }




}