import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';

import '../../loader/ImageLoader.dart';

class LaserYellow extends IBasicBullet{



  LaserYellow() : super(ImageLoader.sprites[EnumImages.LaserYellow]!, Vector2(10, 30), 2, 500, 300, EnumGoodAginst.no);

}