
import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';
import '../basic/effects/EnumEffects.dart';

class Lucrehulk extends EffectShip

{






  Lucrehulk(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISLucrehulk]!, positionx, positiony, imagesizex, imagesizey, 2500, 2000, currentteam, EnumNation.CIS, 7,  EnumShipClass.Mothership);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserRed;
    super.setEffect(EnumEffects.shootRocketOne, 200);
  }


}