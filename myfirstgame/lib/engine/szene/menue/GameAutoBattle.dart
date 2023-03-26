


import 'package:flame/components.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../player/Player.dart';

class GameAutoBattle extends Component with HasGameRef<MySpaceGame>

{



  List<Player> palyers = [];


  @override
  Future<void> onLoad() async

  {
    initSzene();


  }

  @override
  void update(double dt) {
    super.update(dt);

  }

  void initSzene() {}






}