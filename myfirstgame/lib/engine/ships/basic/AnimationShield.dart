


import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class AnimationShield extends SpriteAnimationComponent
{




  AnimationShield();


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    print("shield animation");
    Image image = await Flame.images.load("elements/animated/ShipShield1.png");
    animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
        amount: 12, stepTime: 0.1, textureSize: Vector2(128, 128), loop: removeOnFinish));
    size = Vector2(40, 50);

  }
}