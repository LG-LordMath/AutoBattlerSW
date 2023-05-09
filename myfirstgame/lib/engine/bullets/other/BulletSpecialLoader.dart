
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/bullets/other/EnumSpecialList.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBig.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonMedium.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonSmall.dart';

class BulletSpecialLoader
{
  static Map<EnumSpecialList, IoncanonBullet> special  = {};
  late SpriteAnimation animationsblue;
  late SpriteAnimation animationsorange;
  late SpriteAnimation animationsred;
  Future<void> load()
  async {
    Image imageblue = await Flame.images.load("elements/animated/BlueShield.png");
     animationsblue = SpriteAnimation.fromFrameData(imageblue, SpriteAnimationData.sequenced(
        amount: 12, stepTime: 0.1, textureSize: Vector2(128, 128) ));
    Image imageorange = await Flame.images.load("elements/animated/OrangeShield.png");
     animationsorange = SpriteAnimation.fromFrameData(imageorange, SpriteAnimationData.sequenced(
        amount: 12, stepTime: 0.1, textureSize: Vector2(128, 128) ));
    Image imagered = await Flame.images.load("elements/animated/RedShield.png");
     animationsred = SpriteAnimation.fromFrameData(imagered, SpriteAnimationData.sequenced(
        amount: 12, stepTime: 0.1, textureSize: Vector2(128, 128) ));
    special[EnumSpecialList.IoncanonShootSmall] = IoncanonSmall(animationsblue);
    special[EnumSpecialList.IoncanonShootMedium] = IoncanonMedium(animationsorange);
    special[EnumSpecialList.IoncanonShootBig] = IoncanonBig(animationsred);
  }
  void reloadObject(EnumSpecialList specialList)
  {
    switch (specialList){

      case EnumSpecialList.IoncanonShootSmall:
        special[EnumSpecialList.IoncanonShootSmall] = IoncanonSmall(animationsblue);
        break;
      case EnumSpecialList.IoncanonShootMedium:
        special[EnumSpecialList.IoncanonShootMedium] = IoncanonMedium(animationsorange);
        break;
      case EnumSpecialList.IoncanonShootBig:
        special[EnumSpecialList.IoncanonShootBig] = IoncanonBig(animationsred);
        break;
    }
  }
}