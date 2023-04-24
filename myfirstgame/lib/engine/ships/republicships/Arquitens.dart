

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';
class Arquitens extends BasicShip

{






Arquitens(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
    : super(ImageLoader.sprites[EnumImages.ShipRepublicARQUITENS]!, positionx, positiony, imagesizex, imagesizey, 1100, 800, currentteam, EnumNation.Republic, 6, EnumShipClass.Battleship);


@override
Future<void> onLoad() async
{
super.onLoad();

}


}