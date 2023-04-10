


import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MyAnimatedSzene extends SpriteComponent with HasGameRef<MySpaceGame>
{


  late double positionX;
  late double positionY;


  MyAnimatedSzene(this.positionX, this.positionY);



  @override
  Future<void> onLoad() async
  {
    parent = gameRef;
    sprite = Sprite(await Flame.images.load("background/space1.png"));
    position = Vector2(positionX, positionY);
    size = Vector2(gameRef.size[0], gameRef.size[1] / 1.4);



  }

  void destroy()
  {
    gameRef.remove(this);
  }


}