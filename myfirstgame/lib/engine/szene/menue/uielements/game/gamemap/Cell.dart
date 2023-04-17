
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../ships/BasicShip.dart';



class Cell extends PositionComponent with HasGameRef<MySpaceGame>{
  late bool isOccupied;
  late Vector2 psize;
  late Vector2 pposition;
  final _defaultColor = Colors.red;
  late ShapeHitbox hitbox;

  Cell(this.isOccupied,this.psize, this.pposition);

  @override
  Future<void> onLoad() async
  {
    size = psize;
    position  = pposition;


    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
   add(hitbox);


  }


  void occupyCell()
  {
    isOccupied = true;

  }
  void deoccupyCell()
  {
    isOccupied = false;

  }
  void setShipPosition(BasicShip ship){

    if(ship.currentteam == 1){
      ship.setPosition(absolutePosition);
    }else {
      ship.setPosition(absolutePosition);
      final effect = RotateEffect.to(
        tau/2,
        EffectController(duration: 0), );
      ship.add(effect);
      //ship.setPosition( Vector2(absolutePosition.x - gameRef.size[0] / 1.2 , absolutePosition.y - gameRef.size[1]/ 3.0));

    }

    print(ship.toString() + "set position to " + absolutePosition.toString());
  }




}