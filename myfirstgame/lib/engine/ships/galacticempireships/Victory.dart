
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/EnumShipClass.dart';
import '../basic/effects/EnumEffects.dart';

class Victory extends EffectShip

{






  Victory(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireVictory]!, positionx, positiony, imagesizex, imagesizey, 2500, 2500, currentteam, EnumNation.Imperium, 8, EnumShipClass.Mothership);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserGreen;
    super.setEffect(EnumEffects.shootRocketTwo, 200);
  }


}