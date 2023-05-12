
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class AnimationBlueSpecial extends SpriteAnimationComponent
{




  AnimationBlueSpecial();


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    // print("shield animation");
    Image imageblue = await Flame.images.load("elements/animated/BlueShield.png");
    animation = SpriteAnimation.fromFrameData(imageblue, SpriteAnimationData.sequenced(
        amount: 3, stepTime: 0.1, textureSize: Vector2(128, 128) ));


  }
}