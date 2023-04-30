

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../nations/EnumNation.dart';
import '../basic/EnumShipClass.dart';
class ArquitensEmpire extends BasicShip

{






  ArquitensEmpire(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
    : super(ImageLoader.sprites[EnumImages.ShipEmpireArquitens]!, positionx, positiony, imagesizex, imagesizey, 1000, 600, currentteam, EnumNation.Imperium, 5, EnumShipClass.Battleship);


@override
Future<void> onLoad() async
{
  super.onLoad();
  super.laser = EnumLaserList.LaserGreen;
}


}