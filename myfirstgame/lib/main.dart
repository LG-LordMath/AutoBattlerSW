
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'engine/loader/ImageLoader.dart';
import 'game/MySpaceGame.dart';

void main() {

  print("start game");
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);

  runApp(GameWidget(game: MySpaceGame()));

  /*
  runApp(


    MaterialApp(


        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home:  const MainMenue(),
    )
  );
  *7

   */
}





