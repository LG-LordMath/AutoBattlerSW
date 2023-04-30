import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EnumEffects.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';

class TieBomber extends EffectShip

{






  TieBomber(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireTieBomber]!, positionx, positiony, imagesizex, imagesizey, 750, 0, currentteam, EnumNation.Imperium, 3,  EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserGreen;
    super.setEffect(EnumEffects.shootRocketTwo, 200);
  }


}