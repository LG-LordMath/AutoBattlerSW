
import 'package:flame/components.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';

class Valture extends BasicShip

{






  Valture(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISValture]!, positionx, positiony, imagesizex, imagesizey, 500, 0, currentteam, EnumNation.CIS, 2, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserRed;

  }


}