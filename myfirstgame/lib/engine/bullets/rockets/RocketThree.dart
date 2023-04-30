import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../EnumGoodAginst.dart';
import '../IBasicBullet.dart';

class RocketThree extends IBasicBullet{



  RocketThree() : super(ImageLoader.sprites[EnumImages.RocketThree]!, Vector2(30, 30), 2, 500, 300, EnumGoodAginst.shield);

}