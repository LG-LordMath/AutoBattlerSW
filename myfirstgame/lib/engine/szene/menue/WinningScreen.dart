
import 'dart:io';

import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class WinningScreen extends SpriteComponent with HasGameRef<MySpaceGame>

{
  @override
  Future<void> onLoad() async

  {

    sprite = ImageLoader.sprites[EnumImages.UICardOneStripe];
    position = Vector2(gameRef.size[0] / 8, gameRef.size[1] / 4);
    size = Vector2(300, 300);



    MyTextField textFieldueber = MyTextField(position.x + 90,position.y + 60,  "You Won", Colors.red);
    add(textFieldueber);
    MyTextField textField = MyTextField(position.x +90, position.y + 120,  "You won \nthe game", Colors.white);
    add(textField);

    Button button = Button(ImageLoader.sprites[EnumImages.UICardOne]!, 100, 50, Vector2(position.x + 100, position.y + 220), mainMenue, "Close");
    add(button);




  }

  @override
  void update(double dt)
  {
    super.update(dt);


  }

  void mainMenue()
  {
    //print("Exiting app");
    removeAll(children);

    gameRef.startMainMenue();
    //exit(0);
  }


}