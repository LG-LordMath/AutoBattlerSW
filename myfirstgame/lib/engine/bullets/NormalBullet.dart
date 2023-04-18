

import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../basics/MovementDirection.dart';

class NormalBullet extends SpriteComponent with CollisionCallbacks, HasGameRef<MySpaceGame>
{
  final _defaultColor = Colors.red;
  Vector2 _enemy = Vector2(0, 0);
  Vector2 _currentship = Vector2(0, 0);
  late int _team;

  final double _imagesizex = 10;
  final double _imagesizey = 30;
  final int movementspeed = 2;
  int lifetime = 300;
  final int damage = 100;
  bool _isplayingmusic = false;

  NormalBullet(this._currentship, this._enemy, this._team){
  }
  @override
  Future<void> onLoad() async
  {
    super.onLoad();
      sprite = ImageLoader.sprites[EnumImages.LaserOne];
      parent = gameRef;
      size = Vector2(_imagesizex, _imagesizey);
      position = _currentship;
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    ShapeHitbox hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
      add(hitbox);
    if(!_isplayingmusic)
    {
    //  FlameAudio.play('Laser.ogg')..timeout(Duration(seconds: 2));
      _isplayingmusic = true;

    }





    final effect = MoveEffect.to( _enemy, EffectController(duration: 5));
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