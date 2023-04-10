


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';

import 'EnumGoodAginst.dart';

class Laser extends IBasicBullet


{
  Laser( Sprite image,  double imagesizex, double imagesizey,
      int damage, int lifetime, int team,  EnumMusic sound) :
  super(image, imagesizex, imagesizey, damage, lifetime, team, EnumGoodAginst.hp, sound);




}