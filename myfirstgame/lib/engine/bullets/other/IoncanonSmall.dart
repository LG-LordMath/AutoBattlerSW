



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';

class IoncanonSmall extends IoncanonBullet

{


  IoncanonSmall(SpriteAnimationComponent ani) :
        super(Vector2(50, 50), 1.5, 100, ani, 40);


}