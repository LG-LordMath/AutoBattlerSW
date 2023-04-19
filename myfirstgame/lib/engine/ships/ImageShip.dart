

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../game/MySpaceGame.dart';
import '../bullets/EnumGoodAginst.dart';
import '../bullets/NormalBullet.dart';

class ImageShip extends SpriteComponent with HasGameRef<MySpaceGame>, CollisionCallbacks



{
  late BasicShip ship;
  final _defaultColor = Colors.cyan;
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
    if(ship.currentteam == 1){
      final effect = RotateEffect.to(
        tau/4,
        EffectController(duration: 0), );
      add(effect);
      position = Vector2(position.x+50, position.y);
    }else {
      final effect = RotateEffect.to(
        tau/4,
        EffectController(duration: 0), );
      add(effect);
      position = Vector2(position.x+50  , position.y);
      ship.scale = Vector2(ship.shipclass.CellsizeX.toDouble(), ship.shipclass.CellsizeY.toDouble());
    }


  }


  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

      if (other is NormalBullet) {
        print("collosion with bullet");
        if (other.team == ship.currentteam) {
          print("same team");
        } else {
          print(" hit ");
          // damage(other.damage, other.goodAginst);
          ship.damage(other.damage, EnumGoodAginst.hp);
          other.removeFromParent();
        }
      }else {
        print("colliding with other: " + other.toString());
      }
  }


}