
import 'dart:io';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/BulletLaserLoader.dart';
import 'package:myfirstgame/engine/bullets/rockets/BulletRocketLoader.dart';
import 'package:myfirstgame/engine/client/TCPclient.dart';
import 'package:myfirstgame/engine/player/EnumPlayerImages.dart';
import 'package:myfirstgame/engine/player/ai/PlayerAi.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackgroundElements.dart';
import 'package:myfirstgame/engine/szene/menue/GameAutoBattle.dart';
import 'package:myfirstgame/engine/szene/menue/LoadingScreen.dart';
import 'package:myfirstgame/engine/szene/menue/MainMenue.dart';
import 'package:myfirstgame/engine/szene/menue/WinningScreen.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/LosingScreen.dart';

import '../engine/player/Player.dart';
import '../engine/szene/background/Background.dart';


class MySpaceGame extends FlameGame with HasCollisionDetection, HasDraggableComponents,  HasTappableComponents, HasTappablesBridge{


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
    _losingScreen = LosingScreen();
    add(_losingScreen);

  }
  void setwinningscreen()
  {

    gameAutoBattle.removeAll(gameAutoBattle.children);
    remove(gameAutoBattle);
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

    TCPclient tcPclient =TCPclient('192.168.34.245', 40000);
    tcPclient.connectToServer();
    /*
    Socket.connect('192.168.34.245', 40000).then((Socket socket) {
      print('Connected to server: ${socket.remoteAddress}:${socket.remotePort}');

      socket.listen((List<int> data) {
        String message = String.fromCharCodes(data).trim();
        print('Received from server: $message');
      }, onError: (error) {
        print('Error: $error');
      }, onDone: () {
        print('Server disconnected');
      });

      socket.write('Hello from Dart Flutter!');
    }).catchError((error) {
      print('Error: $error');
    });

     */


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
    EnumPlayerImages image = EnumPlayerImages.image1;
    Player player = Player("Gast", 8, image);
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