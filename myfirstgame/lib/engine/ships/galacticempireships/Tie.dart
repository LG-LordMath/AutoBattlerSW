import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../../turrets/LaserCannon.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class Tie extends BasicShip

{






  Tie(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireTie]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3,  EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
    super.weapons.add(laserCannon);


  }


}