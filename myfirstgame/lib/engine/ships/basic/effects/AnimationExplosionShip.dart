import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class AnimationExplosionShip extends SpriteAnimationComponent with HasGameRef<MySpaceGame>
{

  late Vector2 positionfromShip;


  AnimationExplosionShip(this.positionfromShip);


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    // print("shield animation");

    Random random = new Random();
    int randomNumber = random.nextInt(3);
    switch(randomNumber){
      case 0:
        Image image = await Flame.images.load("elements/animated/Explosion4.png");
        animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
            amount: 80, stepTime: 0.1, textureSize: Vector2(100, 100), loop: removeOnFinish));
        size = Vector2(50, 50);
      //  parent = gameRef;
        position = positionfromShip;
        gameRef.gameAutoBattle.add(this);
        break;
      case 1:
        Image image = await Flame.images.load("elements/animated/Explosion5.png");
        animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
            amount: 90, stepTime: 0.1, textureSize: Vector2(100, 100), loop: removeOnFinish));
        size = Vector2(50, 50);
        //parent = gameRef;
        position = positionfromShip;
        gameRef.gameAutoBattle.add(this);
        break;
      case 2:
        Image image = await Flame.images.load("elements/animated/Explosion6.png");
        animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
            amount: 80, stepTime: 0.1, textureSize: Vector2(100, 100), loop: removeOnFinish));
        size = Vector2(50, 50);
      //  parent = gameRef;
        position = positionfromShip;
        gameRef.gameAutoBattle.add(this);
        break;

    }



  }
}