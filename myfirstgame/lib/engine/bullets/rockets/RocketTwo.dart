import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../EnumGoodAginst.dart';
import '../IBasicBullet.dart';

class RocketTwo extends IBasicBullet{



  RocketTwo() : super(ImageLoader.sprites[EnumImages.RocketOne]!, Vector2(30, 30), 2, 500, 300, EnumGoodAginst.hp);

}