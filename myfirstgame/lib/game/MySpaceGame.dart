import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/background/Background.dart';
import 'package:myfirstgame/engine/basics/MyCollidable.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection  {



  final double charactersize = 100;
  late BasicShip base;
  late BasicShip base1;
  late BasicShip base2;
  late MyCollidable coll;

  List<BasicShip> team1 = [];
  List<BasicShip> team2 = [];

  @override
  Future<void> onLoad() async

  {
    await super.onLoad();

    final screenwidth = size[0];
    final screenheight = size[1];
    add(Background());
    print("laod assets, screen: x" + size[1].toString() + ", y "+size[0].toString() );
    base = BasicShip(0, 'ship.png', 200, 10, 100, 100, 1000, 100, 1);
    base1 = BasicShip(0, 'ship.png', 200, 400, 100, 100, 100, 100, 2);
    base2 = BasicShip(1, 'ship.png', 250, 400, 100, 100, 100, 100, 2);
    team1.add(base);
    team2.add(base1);
    team2.add(base2);
    add(base);
    add(base1);
    add(base2);
    add(ScreenHitbox());


  }
  @override
  void update(double dt){
    super.update(dt);

  }
}