
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';

import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../nations/EnumNation.dart';
import '../EnumShipClass.dart';
class ETA2Actis extends BasicShip

{






  ETA2Actis(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicETA2ARCTIS]!, positionx, positiony, imagesizex, imagesizey, 700, 100, currentteam, EnumNation.Republic, 3, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserBlue;

  }


}