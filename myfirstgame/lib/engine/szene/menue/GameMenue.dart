import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import '../../../game/MySpaceGame.dart';


MySpaceGame _game = MySpaceGame();

class GamePlay extends StatelessWidget
{



  const GamePlay ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
        game: _game,
    );
  }

}