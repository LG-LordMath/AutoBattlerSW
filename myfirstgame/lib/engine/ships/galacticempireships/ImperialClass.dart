
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';
import '../basic/effects/EnumEffects.dart';

class ImperialClass extends EffectShip

{






  ImperialClass(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireImperialClass]!, positionx, positiony, imagesizex, imagesizey, 3000, 3000, currentteam, EnumNation.Imperium, 10, EnumShipClass.Mothership);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserGreen;
    super.setEffect(EnumEffects.shootRocketOne, 200);
  }


}