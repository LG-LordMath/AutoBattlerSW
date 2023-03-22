

import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../basics/MovementDirection.dart';

class NormalBullet extends SpriteComponent with CollisionCallbacks, HasGameRef<MySpaceGame>
{
  final _defaultColor = Colors.red;
  Vector2 _enemy = Vector2(0, 0);
  Vector2 _currentship = Vector2(0, 0);
  late int _team;
  final String _imagepath = 'laser.png';
  final double _imagesizex = 10;
  final double _imagesizey = 30;
  MovementDirection _movment  = MovementDirection.no;
  final int movementspeed = 2;
  int lifetime = 100;
  final int damage = 100;

  NormalBullet(this._currentship, this._enemy, this._team){
  }
  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    if(_imagepath.isNotEmpty){
      sprite = await gameRef.loadSprite(_imagepath); }
      size = Vector2(_imagesizex, _imagesizey);
      position = Vector2(0, 0
      );
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    ShapeHitbox hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
      add(hitbox);


    final effect = MoveEffect.to(_enemy - _currentship, EffectController(duration: 3));
    add(effect);
  }

  @override
  void update(double dt){
    super.update(dt);


    lifetime--;
    if(lifetime <=  0){
      removeFromParent();
    }


  }
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is ScreenHitbox) {
      removeFromParent();
    }else if(other is BasicShip)
    {
      if(other.currentteam != _team){
        removeFromParent();
      }
    }
  }

  int get team => _team;

  set team(int value) {
    _team = value;
  }
}