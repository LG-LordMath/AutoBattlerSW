

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class NormalBullet extends SpriteComponent with CollisionCallbacks, HasGameRef<MySpaceGame>
{
  late Vector2 _enemy;
  late Vector2 _currentpossition;
  String _imagepath = 'laser.png';
  double _imagesizex = 10;
  double _imagesizey = 30;

  NormalBullet(this._currentpossition, this._enemy){
    position = _currentpossition;
  }
  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    if(_imagepath.isNotEmpty){
      sprite = await gameRef.loadSprite(_imagepath); }
    size = Vector2(_imagesizex, _imagesizey);

  }
  @override
  void update(double dt){
    super.update(dt);
    final effect = MoveEffect.to(_enemy, EffectController(duration: 2));
    add(effect);

  }


}