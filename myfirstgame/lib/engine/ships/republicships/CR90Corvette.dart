import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/turrets/LaserCannon.dart';

import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';
class CR90Corvette extends BasicShip

{






  CR90Corvette(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicCR90CORVETTE]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Republic, 3);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
   // super.shipclass = EnumShipClass.Battleship;
    LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
    super.weapons.add(laserCannon);


  }


}