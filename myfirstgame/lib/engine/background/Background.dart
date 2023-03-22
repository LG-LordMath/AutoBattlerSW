
import 'package:flame/components.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'GlobalsBackground.dart';


class Background extends SpriteComponent with HasGameRef<MySpaceGame>
{
  @override
  Future<void> onLoad() async

  {
    sprite = await gameRef.loadSprite(GlobalsBackground.backgroundFive.toString());
    size = gameRef.size;
  }
}