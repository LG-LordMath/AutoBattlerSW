import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class AnimationRedSpecial extends SpriteAnimationComponent
{




  AnimationRedSpecial();


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    // print("shield animation");
    Image imagered = await Flame.images.load("elements/animated/RedShield.png");
    animation = SpriteAnimation.fromFrameData(imagered, SpriteAnimationData.sequenced(
        amount: 3, stepTime: 0.1, textureSize: Vector2(128, 128) ));


  }
}