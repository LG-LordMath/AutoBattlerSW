

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/turrets/LaserCannon.dart';

import '../../nations/EnumNation.dart';
class ArquitensEmpire extends BasicShip

{






  ArquitensEmpire(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
    : super(ImageLoader.sprites[EnumImages.ShipEmpireArquitens]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3);


@override
Future<void> onLoad() async
{
super.onLoad();

LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
super.weapons.add(laserCannon);


}


}