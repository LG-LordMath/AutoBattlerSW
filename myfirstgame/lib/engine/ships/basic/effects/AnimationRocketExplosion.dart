


import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class AnimationRocketExplosion extends SpriteAnimationComponent
{




  AnimationRocketExplosion();


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    // print("shield animation");

    Random random = new Random();
    int randomNumber = random.nextInt(3);
  switch(randomNumber){
    case 0:
      Image image = await Flame.images.load("elements/animated/Explosion1.png");
      animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
          amount: 16, stepTime: 0.1, textureSize: Vector2(54, 48), loop: removeOnFinish));
      size = Vector2(20, 20);
      break;
    case 1:
      Image image = await Flame.images.load("elements/animated/Explosion2.png");
      animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
          amount: 16, stepTime: 0.1, textureSize: Vector2(64, 64), loop: removeOnFinish));
      size = Vector2(20, 20);
      break;
    case 2:
      Image image = await Flame.images.load("elements/animated/Explosion3.png");
      animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
          amount: 70, stepTime: 0.1, textureSize: Vector2(100, 100), loop: removeOnFinish));
      size = Vector2(20, 20);
      break;

  }



  }
}