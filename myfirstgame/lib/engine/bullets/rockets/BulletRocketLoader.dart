
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/bullets/rockets/EnumRocketList.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketOne.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketThree.dart';
import 'package:myfirstgame/engine/bullets/rockets/RocketTwo.dart';

class BulletRocketLoader{


  static Map<EnumRocketList, IBasicBullet> rockets  = {};

  void load()
  {

    rockets[EnumRocketList.RocketOne] = RocketOne();
    rockets[EnumRocketList.RocketTwo] = RocketTwo();
    rockets[EnumRocketList.RocketThree] = RocketThree();

  }

  void reloadObject(EnumRocketList rocket)
  {
    switch (rocket){

      case EnumRocketList.RocketOne:
        rockets[EnumRocketList.RocketOne] = RocketOne();
        break;
      case EnumRocketList.RocketTwo:
        rockets[EnumRocketList.RocketTwo] = RocketTwo();
        break;
      case EnumRocketList.RocketThree:
        rockets[EnumRocketList.RocketThree] = RocketThree();
        break;
    }
  }



}