

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';
class ArquitensEmpire extends BasicShip

{






  ArquitensEmpire(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
    : super(ImageLoader.sprites[EnumImages.ShipEmpireArquitens]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3, EnumShipClass.Battleship);


@override
Future<void> onLoad() async
{
  super.onLoad();
}


}