
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../nations/EnumNation.dart';
import '../basic/EnumShipClass.dart';
import '../basic/effects/EnumEffects.dart';
class CR90Corvette extends EffectShip

{






  CR90Corvette(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicCR90CORVETTE]!, positionx, positiony, imagesizex, imagesizey, 1200, 2000, currentteam, EnumNation.Republic, 6, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserBlue;
    super.setEffect(EnumEffects.masterheal, 200);
  }


}