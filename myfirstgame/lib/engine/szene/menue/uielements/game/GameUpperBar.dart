



import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'GameUpperBarAccountUI.dart';

class GameUpperBar extends PositionComponent with HasGameRef<MySpaceGame>
{


  late  GameUpperBarAccountUI playerOneUI;
  late  GameUpperBarAccountUI playerTwoUI;
  final effectgreen = ColorEffect(
    Colors.greenAccent,
    const Offset(0.0, 0.8),
    EffectController(duration: 4),
  );
  final effectred = ColorEffect(
    Colors.redAccent,
    const Offset(0.0, 0.8),
    EffectController(duration: 4),
  );

  @override
  Future<void> onLoad() async

  {

    parent = gameRef;
    position = Vector2(0, 0);
    size = Vector2(gameRef.size[0], 100);
    playerOneUI  = GameUpperBarAccountUI(gameRef.gameAutoBattle.player1, gameRef.size[0] / 3,  10, effectgreen);



    playerTwoUI  = GameUpperBarAccountUI(gameRef.gameAutoBattle.player2, gameRef.size[0] / 3, gameRef.size[0] / 1.5, effectred);

    add(playerOneUI);
    add(playerTwoUI);
  }

  void destroy(){
    playerOneUI.destroy();
    playerTwoUI.destroy();
    removeFromParent();
  }

}