
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/bullets/other/AnimationOrangeSpecial.dart';
import 'package:myfirstgame/engine/bullets/other/EnumSpecialList.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBig.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonMedium.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonSmall.dart';

import 'AnimationBlueSpecial.dart';
import 'AnimationRedSpecial.dart';

class BulletSpecialLoader
{
  static Map<EnumSpecialList, IoncanonBullet> special  = {};

  Future<void> load()
  async {

    AnimationBlueSpecial blueSpecial=  AnimationBlueSpecial();
    AnimationOrangeSpecial orangeSpecial=  AnimationOrangeSpecial();
    AnimationRedSpecial redSpecial=  AnimationRedSpecial();
 special[EnumSpecialList.IoncanonShootSmall] = IoncanonSmall(blueSpecial);
    special[EnumSpecialList.IoncanonShootMedium] = IoncanonMedium(orangeSpecial);
    special[EnumSpecialList.IoncanonShootBig] = IoncanonBig(redSpecial);
  }
  Future<void> reloadObject(EnumSpecialList specialList)
  async {
    switch (specialList)
    {
      case EnumSpecialList.IoncanonShootSmall:
        AnimationBlueSpecial blueSpecial=  AnimationBlueSpecial();
      special[EnumSpecialList.IoncanonShootSmall] = IoncanonSmall(blueSpecial);
        break;
      case EnumSpecialList.IoncanonShootMedium:
        AnimationOrangeSpecial orangeSpecial=  AnimationOrangeSpecial();
     special[EnumSpecialList.IoncanonShootMedium] = IoncanonMedium(orangeSpecial);
        break;
      case EnumSpecialList.IoncanonShootBig:
        AnimationRedSpecial redSpecial=  AnimationRedSpecial();
     special[EnumSpecialList.IoncanonShootBig] = IoncanonBig(redSpecial);
        break;
    }
  }
}

