


import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';


class ARC170 extends BasicShip

{



  


  ARC170(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicARC170]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Republic, 3, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();


  }


}