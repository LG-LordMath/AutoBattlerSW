





import 'dart:collection';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../ships/BasicShip.dart';

class GamePlayFieldMap extends SpriteComponent with HasGameRef<MySpaceGame>

{

  final Map<int, BasicShip> gamefield = HashMap();

  late double positionX;
  late double positionY;

  GamePlayFieldMap(this.positionX, this.positionY);


  @override
  Future<void> onLoad() async
  {
    sprite = ImageLoader.sprites[EnumImages.UIIconCellThree];
    parent = gameRef;
    position = Vector2(positionX, positionY);
    size = Vector2(200,  gameRef.size[1]/ 3.5);
  }




  }