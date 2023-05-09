import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';

class IoncanonBig extends IoncanonBullet

{


  IoncanonBig(SpriteAnimation ani) :
        super(Vector2(50, 50), 1.5, 300, ani, 80);


}