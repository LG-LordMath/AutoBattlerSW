


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/turrets/LaserCannon.dart';

import '../../nations/EnumNation.dart';


class ARC170 extends BasicShip

{


  EnumNation nation =  EnumNation.Republic;
  


  ARC170(double positionx, double positiony, double imagesizex, double imagesizey, int  currentteam)
      : super(ImageLoader.sprites[EnumImages.ShipRepublicARC170]!, positionx, positiony, imagesizex, imagesizey, 750, 300, currentteam);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();

    LaserCannon laserCannon = LaserCannon(Vector2(super.positionx, super.positiony), 80, super.currentteam);
    super.weapons.add(laserCannon);


  }


}