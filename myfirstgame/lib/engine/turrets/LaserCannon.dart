

import 'package:myfirstgame/engine/bullets/Laser.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';
import 'package:myfirstgame/engine/turrets/weaponturret/BasicWeaponCanon.dart';

class LaserCannon extends BasicWeaponCanon
{


  late int _team;

  LaserCannon(super.currentshipsize, super._maxreloadtime, this._team);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();


  }


  addGreenLaser(int damage, int lifetime, int team)

  {
    Laser laser = Laser(ImageLoader.sprites[EnumImages.LaserOne]!,
        30, 10, damage, lifetime, team, EnumMusic.LaserOne);
  }





}