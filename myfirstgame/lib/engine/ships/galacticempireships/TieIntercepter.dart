import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class TieIntercepter extends BasicShip

{






  TieIntercepter(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireTieIntercepter]!, positionx, positiony, imagesizex, imagesizey, 500, 150, currentteam, EnumNation.Imperium, 3,  EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();


  }


}