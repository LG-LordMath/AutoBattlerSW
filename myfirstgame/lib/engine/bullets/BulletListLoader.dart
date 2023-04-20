

import 'package:myfirstgame/engine/bullets/EnumBulletList.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/bullets/Laser.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';

class GalaticEmpireShipsLoader {


  static Map<EnumBulletList, IBasicBullet> bulletlist = {};

  void load() {
    bulletlist[EnumBulletList.Laser] = Laser(ImageLoader.sprites[EnumImages.LaserOne]!, 10, 20, 100, 300, 0, EnumMusic.LaserOne);

  }
  void reloadObject(EnumBulletList bullet) {
    switch (bullet) {
      case EnumBulletList.Laser:
        bulletlist[EnumBulletList.Laser] = Laser(ImageLoader.sprites[EnumImages.LaserOne]!, 10, 20, 100, 300, 0, EnumMusic.LaserOne);
        break;
    }

  }
}