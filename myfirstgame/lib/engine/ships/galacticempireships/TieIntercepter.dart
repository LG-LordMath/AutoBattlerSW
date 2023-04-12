import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../../turrets/LaserCannon.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class TieIntercepter extends BasicShip

{






  TieIntercepter(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireTieIntercepter]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.shipclass = EnumShipClass.Fighter;
    LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
    super.weapons.add(laserCannon);


  }


}