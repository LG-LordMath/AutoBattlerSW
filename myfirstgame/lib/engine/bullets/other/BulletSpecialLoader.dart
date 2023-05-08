
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/bullets/other/EnumSpecialList.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';
import 'package:myfirstgame/engine/bullets/rockets/EnumRocketList.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketOne.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketThree.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketTwo.dart';

class BulletSpecialLoader{


  static Map<EnumSpecialList, IBasicBullet> special  = {};

  void load()
  {

    special[EnumSpecialList.IoncanonShootSmall] = IoncanonBullet();
    special[EnumSpecialList.IoncanonShootMedium] = IoncanonBullet();
    special[EnumSpecialList.IoncanonShootBig] = IoncanonBullet();

  }

  void reloadObject(EnumSpecialList specialList)
  {
    switch (specialList){

      case EnumSpecialList.IoncanonShootSmall:
        special[EnumSpecialList.IoncanonShootSmall] = IoncanonBullet();
        break;
      case EnumSpecialList.IoncanonShootMedium:
        special[EnumSpecialList.IoncanonShootMedium] = IoncanonBullet();
        break;
      case EnumSpecialList.IoncanonShootBig:
        special[EnumSpecialList.IoncanonShootBig] = IoncanonBullet();
        break;
    }
  }



}