import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';

class IoncanonMedium extends IoncanonBullet

{


  IoncanonMedium(SpriteAnimationComponent ani) :
        super(Vector2(50, 50), 1.5, 150, ani, 80);


}