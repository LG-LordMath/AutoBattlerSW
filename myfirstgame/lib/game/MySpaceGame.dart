
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/BulletLaserLoader.dart';
import 'package:myfirstgame/engine/bullets/rockets/BulletRocketLoader.dart';
import 'package:myfirstgame/engine/player/ai/PlayerAi.dart';
import 'package:myfirstgame/engine/szene/menue/GameAutoBattle.dart';
import 'package:myfirstgame/engine/szene/menue/LoadingScreen.dart';
import 'package:myfirstgame/engine/szene/menue/MainMenue.dart';
import 'package:myfirstgame/engine/szene/menue/WinningScreen.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/engine/szene/menue/LosingScreen.dart';
import 'package:myfirstgame/game/backend/commander/EnumGameCommanders.dart';
import '../engine/player/Player.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection, HasDraggableComponents,
    HasTappableComponents, HasTappablesBridge{


  late LoadingScreen _loadingScreen;
  late GameAutoBattle gameAutoBattle;
  late MainMenue mainMenue;
  late LosingScreen _losingScreen = LosingScreen();
  late WinningScreen _winningScreen = WinningScreen();
  late BulletLaserLoader bulletLaserLoader = BulletLaserLoader();
  late BulletRocketLoader bulletRocketLoader = BulletRocketLoader();


  void setlosescreeen()
  {

    gameAutoBattle.removeAll(gameAutoBattle.children);
    remove(gameAutoBattle);
    if(!gameAutoBattle.isRemoved){
      gameAutoBattle.removeFromParent();
    }
    _losingScreen = LosingScreen();
    add(_losingScreen);

  }
  void setwinningscreen()
  {

    gameAutoBattle.removeAll(gameAutoBattle.children);
    remove(gameAutoBattle);
    if(!gameAutoBattle.isRemoved){
      gameAutoBattle.removeFromParent();
    }

    _winningScreen = WinningScreen();
    add(_winningScreen);

  }



  @override
  Future<void> onLoad() async

  {
    await super.onLoad();
 //   final screenwidth = size[0];
//    final screenheight = size[1];
   _loadingScreen = LoadingScreen();
    add(_loadingScreen);




  }

  void startMainMenue()
  {
    if(!_losingScreen.isRemoved && _losingScreen != null){
      _losingScreen.removeFromParent();
    }
    mainMenue = MainMenue();
    add(mainMenue);

  }


  void startGameAutoBattleAi()
  {
    //_mainMenue.destroy();
    PlayerAi enemyplayer = searchEnemyPlayer();
    Player player = Player("Gast", 8, mainMenue.charSelection.chars.commanders.elementAt(mainMenue.charSelection.currentposition).commander);
    player.currentcredits = 500;
    enemyplayer.currentcredits = 12;
    mainMenue.removeAll(mainMenue.children);
    mainMenue.destroy();
    gameAutoBattle = GameAutoBattle(player, enemyplayer);
    add(gameAutoBattle);
  }

  void startGameAutoBattleOnline()
  {

  }


  @override
  void update(double dt)
  {
   super.update(dt);

  }

  PlayerAi searchEnemyPlayer()
  {
    return PlayerAi(EnumGameCommanders.CommanderFour.life, EnumGameCommanders.CommanderFour, this);
  }


  LoadingScreen get loadingScreen => _loadingScreen;

  set loadingScreen(LoadingScreen value) {
    _loadingScreen = value;
  }

  void addChild(Button element) {
    add(element);
  }
  void removeChild(Button element){
    remove(element);
  }

}