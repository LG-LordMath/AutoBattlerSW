import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/background/Background.dart';
import 'package:myfirstgame/engine/basics/MyCollidable.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection  {



  final double charactersize = 100;
  late BasicShip base;
  late BasicShip base1;
  late MyCollidable coll;

  @override
  Future<void> onLoad() async

  {
    await super.onLoad();

    final screenwidth = size[0];
    final screenheight = size[1];
    add(Background());
    print("laod assets, screen: x" + size[1].toString() + ", y "+size[0].toString() );
    base = BasicShip('ship.png', 200, 200, 100, 100);
    coll = MyCollidable(canvasSize / 2);
    add(coll);
    add(base);
    add(ScreenHitbox());


  }
  @override
  void update(double dt){
    super.update(dt);

  }
}