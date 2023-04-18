





import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/EnumShipClass.dart';

import '../../bullets/Laser.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../music/EnumMusic.dart';
import '../../nations/EnumNation.dart';
import '../../turrets/LaserCannon.dart';
import '../BasicShip.dart';

class AcclamatorEmpire extends BasicShip

{






  AcclamatorEmpire(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireAcclamator]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
    super.weapons.add(laserCannon);
    add(laserCannon);
    laserCannon.addGreenLaser(30, 300, 1);


  }


}