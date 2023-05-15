
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EnumEffects.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../nations/EnumNation.dart';
import '../basic/EnumShipClass.dart';
class Venator extends EffectShip

{






  Venator(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicVENATOR]!, positionx, positiony, imagesizex, imagesizey, 2800, 3200, currentteam, EnumNation.Republic, 9, EnumShipClass.Mothership);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserBlue;
    super.setEffect(EnumEffects.spawnfighter, 1500);

  }


}