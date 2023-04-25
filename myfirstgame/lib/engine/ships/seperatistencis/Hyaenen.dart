
import 'package:flame/components.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class Hyaenen extends BasicShip

{






  Hyaenen(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISHyaenen]!, positionx, positiony, imagesizex, imagesizey, 500, 200, currentteam, EnumNation.CIS, 2, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserRed;
  }


}