

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/foundation.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';

import '../../../game/MySpaceGame.dart';

class ImageShip extends SpriteComponent with HasGameRef<MySpaceGame>



{
  late BasicShip ship;
  late ShapeHitbox hitbox;
  ImageShip(this.ship);

 @override
  FutureOr<void> onLoad() {
   // TODO: implement onLoad
   super.onLoad();
   parent = ship;
   sprite = ship.getimage;
   size = Vector2(ship.imagesizex, ship.imagesizey);
 }


  void rotateImage(){
    if (kDebugMode) {
      print("${position.x}, ${position.y}");
    }
    final effect = RotateEffect.to(
      tau/4,
      EffectController(duration: 0), );
    add(effect);
    position = Vector2(position.x+50, position.y);
    if(ship.currentteam == 2) {
      ship.scale = Vector2(ship.shipclass.CellsizeX.toDouble(),
          ship.shipclass.CellsizeY.toDouble());
    }


  }

  void destroy()
  {
   removeFromParent();
  }



}