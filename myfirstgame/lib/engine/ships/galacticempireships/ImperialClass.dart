
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class ImperialClass extends BasicShip

{






  ImperialClass(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireImperialClass]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam, EnumNation.Imperium, 3, EnumShipClass.Mothership);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();

  }


}