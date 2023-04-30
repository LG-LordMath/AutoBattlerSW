


import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';

import '../../game/MySpaceGame.dart';
import '../loader/EnumImages.dart';
import '../loader/ImageLoader.dart';
import '../music/EnumMusic.dart';
import '../music/MyMusicPlayer.dart';
import '../ships/basic/BasicShip.dart';
import '../szene/menue/enums/EnumGameState.dart';

abstract class IBasicBullet
    extends SpriteComponent
    with HasGameRef<MySpaceGame>, CollisionCallbacks
{
  final _defaultColor = Colors.red;
  late EnumGoodAginst goodAginst;
  late Vector2 _imagesize;
  late Sprite spriteimage;
  late int _movementspeed;
  late int _lifetime;
  late int _damage;
  late int _team;


  bool _isplayingmusic = false;

  IBasicBullet(this.spriteimage, this._imagesize,this._movementspeed,
      this._damage, this._lifetime, this.goodAginst);

  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    sprite = spriteimage;
    parent = gameRef;
    size = _imagesize;
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    ShapeHitbox hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    if(!_isplayingmusic)
    {
      MyMusicPlayer.play(EnumMusic.LaserOne);
      _isplayingmusic = true;
    }

  }


  void shoot(Vector2 currentship, Vector2 enemyposition, int team)
  {
    _team = team;
    position = currentship;
    final effect = MoveEffect.to( enemyposition, EffectController(duration: _movementspeed.toDouble()));
    add(effect);
    effect.removeOnFinish;
  }



  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.gameAutoBattle.gameState == EnumGameState.FIGHTPHASE) {
      _lifetime--;
      if (_lifetime <= 0) {
        removeFromParent();
      }
    } else {
      removeFromParent();
    }
    @override
    void onCollisionStart(Set<Vector2> intersectionPoints,
        PositionComponent other,) {
      super.onCollisionStart(intersectionPoints, other);
      if (other is ScreenHitbox) {
        removeFromParent();
      } else if (other is BasicShip) {
        if (other.currentteam != _team) {
          //       print("collisio with enemy: bullet: "+_team.toString() + ", ship: "+other.toString());
          //removeFromParent();
        }
      }
    }
  }

  int get team => _team;

  set team(int value) {
    _team = value;
  }

  int get damage => _damage;

  set damage(int value) {
    _damage = value;
  }
}

