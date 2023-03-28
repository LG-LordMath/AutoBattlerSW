



import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MyHeaderMainMenue extends SpriteComponent with HasGameRef<MySpaceGame>

{
  late MyTextField textField;

  @override
  Future<void> onLoad() async
  {
    parent = gameRef;
    sprite = ImageLoader.sprites[EnumImages.UICardTwo];
    size = Vector2(gameRef.size[0], 50);
    textField = MyTextField(gameRef.size[0] / 3, 10, "MY GAME", Colors.white);
    add(textField);
  }


 void destroy()

 {
   textField.destroy();
    this.removeFromParent();
 }



}