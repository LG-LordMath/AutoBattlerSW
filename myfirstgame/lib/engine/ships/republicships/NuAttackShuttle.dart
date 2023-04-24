
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';
class NuAttackShuttle extends BasicShip

{






  NuAttackShuttle(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicNUATTACKSHUTTLE]!, positionx, positiony, imagesizex, imagesizey, 500, 200, currentteam, EnumNation.Republic, 2, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();

  }


}