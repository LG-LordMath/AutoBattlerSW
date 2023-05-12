import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class AnimationOrangeSpecial extends SpriteAnimationComponent
{




  AnimationOrangeSpecial();


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    // print("shield animation");
    Image imageorange = await Flame.images.load("elements/animated/OrangeShield.png");
    animation = SpriteAnimation.fromFrameData(imageorange, SpriteAnimationData.sequenced(
        amount: 3, stepTime: 0.1, textureSize: Vector2(128, 128) ));


  }
}