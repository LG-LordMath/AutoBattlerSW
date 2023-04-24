
import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class Providenz extends BasicShip

{






  Providenz(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISProvidenz]!, positionx, positiony, imagesizex, imagesizey, 1500, 1600, currentteam, EnumNation.CIS, 6, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();

  }


}