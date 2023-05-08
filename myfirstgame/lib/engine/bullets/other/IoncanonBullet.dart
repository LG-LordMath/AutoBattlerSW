




import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';
import '../EnumGoodAginst.dart';
import '../IBasicBullet.dart';

class IoncanonBullet extends IBasicBullet{



  IoncanonBullet() : super(ImageLoader.sprites[EnumImages.RocketOne]!, Vector2(30, 30), 2, 300, 300, EnumGoodAginst.both);

}