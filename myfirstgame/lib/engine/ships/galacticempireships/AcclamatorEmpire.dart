





import 'package:myfirstgame/engine/bullets/lasertypes/EnumLaserList.dart';
import 'package:myfirstgame/engine/ships/basic/EnumShipClass.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EffectShip.dart';
import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import '../basic/BasicShip.dart';
import '../basic/effects/EnumEffects.dart';

class AcclamatorEmpire extends EffectShip

{






  AcclamatorEmpire(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipEmpireAcclamator]!, positionx, positiony, imagesizex, imagesizey, 800, 1200, currentteam, EnumNation.Imperium, 6, EnumShipClass.Battleship);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    super.laser = EnumLaserList.LaserBlue;
    super.setEffect(EnumEffects.spawnfighter, 1500);

  }


}