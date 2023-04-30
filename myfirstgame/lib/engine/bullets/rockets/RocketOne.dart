


import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../EnumGoodAginst.dart';
import '../IBasicBullet.dart';

class RocketOne extends IBasicBullet{



  RocketOne() : super(ImageLoader.sprites[EnumImages.RocketOne]!, Vector2(30, 30), 2, 300, 300, EnumGoodAginst.both);

}