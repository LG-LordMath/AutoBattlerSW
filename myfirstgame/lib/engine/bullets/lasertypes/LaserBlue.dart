



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';

import '../../loader/ImageLoader.dart';

class LaserBlue extends IBasicBullet{



  LaserBlue() : super(ImageLoader.sprites[EnumImages.LaserBlue]!, Vector2(10, 30), 2, 300, 300, EnumGoodAginst.shield);

}