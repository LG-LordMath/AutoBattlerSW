
import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class Munificent extends BasicShip

{






  Munificent(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISMunificent]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.CIS, 3, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();


  }


}