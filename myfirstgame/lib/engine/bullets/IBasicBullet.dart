


import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';

import '../../game/MySpaceGame.dart';
import '../music/EnumMusic.dart';
import '../music/MyMusicPlayer.dart';
import '../ships/BasicShip.dart';
import 'EnumGoodAginst.dart';

abstract class IBasicBullet extends SpriteComponent with HasGameRef<MySpaceGame>, CollisionCallbacks
{

  final _defaultColor = Colors.red;
  //image
  late Sprite _image;
  late double _imagesizex;
  late double _imagesizey;

  //team
  late int _team;

  //
  late int _lifetime;
  late int _damage;

  bool _isplayingmusic = false;


  late EnumGoodAginst goodAginst;
  late EnumMusic sound;


  IBasicBullet(this._image, this._imagesizex, this._imagesizey,
      this._damage, this._lifetime, this._team, this.goodAginst, this.sound);




  void ttackTarget(Vector2 currentship, Vector2 enemyposition)
  {
    size = Vector2(_imagesizex, _imagesizey);
    position = Vector2(currentship.x, currentship.y);
    final effect = MoveEffect.to(enemyposition, EffectController(duration: 3));
    add(effect);
    playSound();
  }





  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    sprite = _image;
    parent = gameRef;
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    ShapeHitbox hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);




  }
  @override
  void update(double dt){
    super.update(dt);


    _lifetime--;
    if(_lifetime <=  0){
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

  void destroy()
  {
    removeFromParent();
  }


  void playSound()
  {
    if(!_isplayingmusic)
    {

      MyMusicPlayer.play(sound);

      _isplayingmusic = true;

    }

  }






  int get damage => _damage;

  set damage(int value) {
    _damage = value;
  }

  int get team => _team;

  set team(int value) {
    _team = value;
  }
}

