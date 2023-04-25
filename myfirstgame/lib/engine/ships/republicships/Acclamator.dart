



import '../../bullets/lasertypes/EnumLaserList.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../BasicShip.dart';
import '../EnumShipClass.dart';

class Acclamator extends BasicShip

{






  Acclamator(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicACCLAMATOR]!, positionx, positiony, imagesizex, imagesizey, 1200, 1000, currentteam, EnumNation.Republic, 6, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserBlue;

  }


}