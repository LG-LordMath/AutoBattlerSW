
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/BulletLaserLoader.dart';
import 'package:myfirstgame/engine/bullets/rockets/BulletRocketLoader.dart';
import 'package:myfirstgame/engine/player/EnumPlayerImages.dart';
import 'package:myfirstgame/engine/player/ai/PlayerAi.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackgroundElements.dart';
import 'package:myfirstgame/engine/szene/menue/GameAutoBattle.dart';
import 'package:myfirstgame/engine/szene/menue/LoadingScreen.dart';
import 'package:myfirstgame/engine/szene/menue/MainMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/LosingScreen.dart';

import '../engine/player/Player.dart';
import '../engine/szene/background/Background.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection, HasDraggableComponents, HasTappables {


  late LoadingScreen _loadingScreen;
  late GameAutoBattle gameAutoBattle;
  late MainMenue _mainMenue;
  late LosingScreen _losingScreen = LosingScreen();
  late BulletLaserLoader bulletLaserLoader = BulletLaserLoader();
  late BulletRocketLoader bulletRocketLoader = BulletRocketLoader();


  void setlosescreeen()
  {

    gameAutoBattle.removeAll(gameAutoBattle.children);
    remove(gameAutoBattle);
    _losingScreen = LosingScreen();
    add(_losingScreen);

  }



  @override
  Future<void> onLoad() async

  {
    await super.onLoad();
    final screenwidth = size[0];
    final screenheight = size[1];
    _loadingScreen = LoadingScreen();
    add(_loadingScreen);



  }

  void startMainMenue()
  {
    if(!_losingScreen.isRemoved && _losingScreen != null){
      _losingScreen.removeFromParent();
    }
    _mainMenue = MainMenue();
    add(_mainMenue);

  }


  void startGameAutoBattleAi()
  {
    //_mainMenue.destroy();
    PlayerAi enemyplayer = searchEnemyPlayer();
    EnumPlayerImages image = EnumPlayerImages.image1;
    Player player = Player("Gast", 8, image);
    player.currentcredits = 12;
    enemyplayer.currentcredits = 12;
    _mainMenue.removeAll(_mainMenue.children);
    _mainMenue.destroy();
    gameAutoBattle = GameAutoBattle(player, enemyplayer);
    add(gameAutoBattle);
  }

  void startGameAutoBattleOnline()
  {

  }


  @override
  void update(double dt){
   super.update(dt);

  }

  PlayerAi searchEnemyPlayer()
  {

    Random random = new Random();
    int randomNumber = random.nextInt(5);
    EnumPlayerImages image;
    switch (randomNumber){
      case 1:
        image = EnumPlayerImages.image1;
        break;
      case 2:
        image = EnumPlayerImages.image2;
        break;
      case 3:
        image = EnumPlayerImages.image3;
        break;
      case 4:
        image = EnumPlayerImages.image4;
        break;
      case 5:
        image = EnumPlayerImages.image5;
        break;
      default:
        image = EnumPlayerImages.image6;
        break;
    }


    return PlayerAi(8, image, this);
  }

  MainMenue get mainMenue => _mainMenue;

  set mainMenue(MainMenue value) {
    _mainMenue = value;
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