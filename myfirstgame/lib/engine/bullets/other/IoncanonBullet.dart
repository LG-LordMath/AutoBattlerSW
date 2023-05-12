





import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/bullets/other/AnimationBlueSpecial.dart';

import '../../../game/MySpaceGame.dart';
import '../../ships/basic/BasicShip.dart';
import '../../szene/menue/enums/EnumGameState.dart';

class IoncanonBullet
    extends PositionComponent
    with HasGameRef<MySpaceGame>, CollisionCallbacks
{
  late Vector2 _imagesize;
  late double _movementspeed;
  late int _lifetime;
  late int _team;
  bool _isplayingmusic = false;
  late SpriteAnimationComponent animationsprite;
  late int stuneffect;

  IoncanonBullet(this._imagesize,this._movementspeed, this._lifetime, this.animationsprite, this.stuneffect);





  @override
  Future<void> onLoad() async
  {
    await super.onLoad();
    parent = gameRef;
    size = _imagesize;
    animationsprite.size = size;
    ShapeHitbox hitbox = CircleHitbox()
      ..renderShape = false;
    add(hitbox);
    add(animationsprite);

    if(!_isplayingmusic)
    {
      //MyMusicPlayer.play(EnumMusic.LaserOne);
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
    if(effect.isRemoved){
      removeFromParent();
    }
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
      }
    }
  }

  int get team => _team;

  set team(int value) {
    _team = value;
  }
}