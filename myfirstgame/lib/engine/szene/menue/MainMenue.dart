



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyHeaderMainMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyMainMenueButtonSection.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MainMenue extends PositionComponent with HasGameRef<MySpaceGame>


{
  late MyMainMenueButtonSection myMainMenueButtonSection;
  late MyHeaderMainMenue myHeaderMainMenue;

  @override
  Future<void> onLoad() async
  {
    position = Vector2(0, gameRef.size[1] - gameRef.size[1] / 3.5);
    myMainMenueButtonSection = MyMainMenueButtonSection(Vector2(0, 0));
    myHeaderMainMenue = MyHeaderMainMenue();
    add(myMainMenueButtonSection);
    add(myHeaderMainMenue);





  }
  @override
  void update(double dt)
  {

  }



}