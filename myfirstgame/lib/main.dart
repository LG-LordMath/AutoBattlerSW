import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

void main() {
  print("start game");
  runApp(GameWidget(game: MyGame()));
}


class MyGame extends FlameGame{



  final double charactersize = 100;
  late BasicShip base;

  @override
  Future<void> onLoad() async

  {
    super.onLoad();
    final screenwidth = size[0];
    final screenheight = size[1];
    print("laod assets, screen: x" + size[1].toString() + ", y "+size[0].toString() );
    base = BasicShip('ship.png', 200, 200, 100, 100);
    add(base);

  }
  @override
  void update(double dt){
    super.update(dt);

  }
}