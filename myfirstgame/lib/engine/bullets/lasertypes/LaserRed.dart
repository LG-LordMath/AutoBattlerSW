import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';

import '../../loader/ImageLoader.dart';

class LaserRed extends IBasicBullet{



  LaserRed() : super(ImageLoader.sprites[EnumImages.LaserRed]!, Vector2(10, 30), 2, 300, 300, EnumGoodAginst.no);

}