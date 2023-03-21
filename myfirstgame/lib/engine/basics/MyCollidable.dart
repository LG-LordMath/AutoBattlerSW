

import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MyCollidable extends SpriteComponent with  HasGameRef<MySpaceGame>, CollisionCallbacks {

  final _collisionStartColor = Colors.amber;
  final _defaultColor = Colors.cyan;



  MyCollidable(Vector2 position)
      : super(
    position: position,
    size: Vector2.all(50),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('ship.png');
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    ShapeHitbox hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is BasicShip) {
      print("collision");
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (!isColliding) {
    }
  }




}