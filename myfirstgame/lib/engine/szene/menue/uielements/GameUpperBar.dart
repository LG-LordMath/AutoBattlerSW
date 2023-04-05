



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'GameUpperBarAccountUI.dart';

class GameUpperBar extends PositionComponent with HasGameRef<MySpaceGame>
{


  late  GameUpperBarAccountUI playerOneUI;
  late  GameUpperBarAccountUI playerTwoUI;
  @override
  Future<void> onLoad() async

  {
    parent = gameRef;
    position = Vector2(0, 0);
    size = Vector2(gameRef.size[0], 100);
    playerOneUI  = GameUpperBarAccountUI(gameRef.gameAutoBattle.player1, gameRef.size[0] / 3,  10);
    add(playerOneUI);
    playerTwoUI  = GameUpperBarAccountUI(gameRef.gameAutoBattle.player2, gameRef.size[0] / 3, gameRef.size[0] / 1.5 );
    add(playerTwoUI);




  }

}