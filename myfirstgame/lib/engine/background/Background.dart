
import 'package:flame/components.dart';
import 'package:myfirstgame/engine/background/GlobalsBackground.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class Background extends SpriteComponent with HasGameRef<MySpaceGame>
{
  @override
  Future<void> onLoad() async

  {
    sprite = await gameRef.loadSprite(GlobalsBackground.backgroundFive.toString());
    size = gameRef.size;
  }
}