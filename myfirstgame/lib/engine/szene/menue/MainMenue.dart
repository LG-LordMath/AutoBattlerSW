



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/mainmenue/GameCharSelection.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/mainmenue/MyAnimatedSzene.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/mainmenue/MyHeaderMainMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/mainmenue/MyMainMenueButtonSection.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MainMenue extends PositionComponent with HasGameRef<MySpaceGame>


{
  MyMainMenueButtonSection  myMainMenueButtonSection = MyMainMenueButtonSection(Vector2(0, 0));
   MyHeaderMainMenue   myHeaderMainMenue = MyHeaderMainMenue();
   MyAnimatedSzene   myAnimatedSzene = MyAnimatedSzene(0,0);
   GameCharSelection charSelection = GameCharSelection();

  @override
  Future<void> onLoad() async
  {
    position = Vector2(0, gameRef.size[1] - gameRef.size[1] / 3.5);


    add(myAnimatedSzene);

    add(myHeaderMainMenue);

    add(myMainMenueButtonSection);
    add(charSelection);

  }
  @override
  void update(double dt)

  {


  }

  void destroy()

  {
    myMainMenueButtonSection.destroy();
    myHeaderMainMenue.destroy();
    myAnimatedSzene.destroy();
    charSelection.destroy();


  }


}