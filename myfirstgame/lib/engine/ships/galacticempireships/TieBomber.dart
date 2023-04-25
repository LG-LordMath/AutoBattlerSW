import 'package:flame/components.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class TieBomber extends BasicShip

{






  TieBomber(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireTieBomber]!, positionx, positiony, imagesizex, imagesizey, 750, 0, currentteam, EnumNation.Imperium, 3,  EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserGreen;
  }


}