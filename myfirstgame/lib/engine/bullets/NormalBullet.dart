

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class NormalBullet extends PositionComponent with CollisionCallbacks
{

  

  @override
  bool onComponentTypeCheck(PositionComponent other) {
   // if (other is Player || other is Water) {
      // do NOT collide with Player or Water
      //return false;
   // }
    return super.onComponentTypeCheck(other);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    // Removes the component when it comes in contact with a Brick.
    // Neither Player nor Water would be passed to this function
    // because these classes are filtered out by [onComponentTypeCheck]
    // in an earlier stage.
    //if (other is Brick) {
     // removeFromParent();
    //}
    super.onCollisionStart(intersectionPoints, other);
  }


}