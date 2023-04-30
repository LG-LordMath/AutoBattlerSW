
import 'package:flame/components.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/EnumShipClass.dart';

class Munificent extends BasicShip

{






  Munificent(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISMunificent]!, positionx, positiony, imagesizex, imagesizey, 1000, 750, currentteam, EnumNation.CIS, 6, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserRed;

  }


}