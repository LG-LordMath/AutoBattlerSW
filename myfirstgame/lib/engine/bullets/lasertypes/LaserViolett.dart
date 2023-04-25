import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';

import '../../loader/ImageLoader.dart';

class LaserViolett extends IBasicBullet{



  LaserViolett() : super(ImageLoader.sprites[EnumImages.LaserViolett]!, Vector2(10, 30), 2, 175, 300, EnumGoodAginst.both);

}