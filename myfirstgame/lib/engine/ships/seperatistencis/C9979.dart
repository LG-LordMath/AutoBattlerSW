
import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class C9979 extends BasicShip

{






  C9979(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipCISC9979]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.CIS, 3, EnumShipClass.Fighter);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();


  }


}