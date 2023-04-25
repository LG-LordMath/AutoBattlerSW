
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/EnumLaserList.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/LaserBlue.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/LaserGreen.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/LaserRed.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/LaserViolett.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/LaserYellow.dart';

class BulletLaserLoader{


  static Map<EnumLaserList, IBasicBullet> lasers  = {};

  void load()
  {

    lasers[EnumLaserList.LaserBlue] = LaserBlue();
    lasers[EnumLaserList.LaserGreen] = LaserGreen();
    lasers[EnumLaserList.LaserRed] = LaserRed();
    lasers[EnumLaserList.LaserViolett] = LaserViolett();
    lasers[EnumLaserList.LaserYellow] = LaserYellow();

  }

  void reloadObject(EnumLaserList laser)
  {
    switch (laser){

      case EnumLaserList.LaserBlue:
        lasers[EnumLaserList.LaserBlue] = LaserBlue();
        break;
      case EnumLaserList.LaserGreen:
        lasers[EnumLaserList.LaserGreen] = LaserGreen();
        break;
      case EnumLaserList.LaserRed:
        lasers[EnumLaserList.LaserRed] = LaserRed();
        break;
      case EnumLaserList.LaserViolett:
        lasers[EnumLaserList.LaserViolett] = LaserViolett();
        break;
      case EnumLaserList.LaserYellow:
        lasers[EnumLaserList.LaserYellow] = LaserYellow();
        break;
    }
  }



}