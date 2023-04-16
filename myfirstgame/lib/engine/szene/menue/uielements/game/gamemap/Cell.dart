
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../ships/BasicShip.dart';



class Cell extends PositionComponent{
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

/*
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);

 */
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
    ship.setPosition(this.absolutePosition);
  }




}