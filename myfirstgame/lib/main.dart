
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'engine/splashscreen/splash.dart';
import 'game/MySpaceGame.dart';

void main() {

  print("start game");
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(GameWidget(game: MySpaceGame()));
}





