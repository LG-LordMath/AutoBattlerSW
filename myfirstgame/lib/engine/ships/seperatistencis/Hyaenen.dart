
import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';
import '../basic/effects/EnumEffects.dart';

class Hyaenen extends EffectShip

{






  Hyaenen(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISHyaenen]!, positionx, positiony, imagesizex, imagesizey, 500, 200, currentteam, EnumNation.CIS, 2, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserRed;
    super.setEffect(EnumEffects.shootRocketThree, 200);
  }


}