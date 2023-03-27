



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MainMenue extends PositionComponent with HasGameRef<MySpaceGame>


{



  @override
  Future<void> onLoad() async
  {
    position = Vector2(0, 0);




  }
  @override
  void update(double dt)
  {

  }



}