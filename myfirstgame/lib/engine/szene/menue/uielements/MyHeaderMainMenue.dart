



import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/mainmenue/GameUIOption.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'Button.dart';

class MyHeaderMainMenue extends SpriteComponent with HasGameRef<MySpaceGame>

{
  late MyTextField textField;
  late Button btnsettings;
  late Button btninstructions;
  late GameUIOption gameOption  = GameUIOption();

  @override
  Future<void> onLoad() async
  {
    parent = gameRef;
    sprite = ImageLoader.sprites[EnumImages.UICardTwo];
    size = Vector2(gameRef.size[0], 50);
    textField = MyTextField(gameRef.size[0] / 3, 10, "MY GAME", Colors.white);
    add(textField);

    Sprite? imageset = ImageLoader.sprites[EnumImages.IconGearSettings];
    btnsettings = Button(imageset!,
        40, 40, Vector2(gameRef.size[0] - 70, 5), settings, "");
    add(btnsettings);


    Sprite? imageinst = ImageLoader.sprites[EnumImages.IconBook];
    btninstructions = Button(imageinst!,
        40, 40, Vector2(gameRef.size[0] - 120, 5), instructions, "");
    add(btninstructions);

  }

  void settings()
  {
    if(!gameOption.isMounted){
      gameRef.mainMenue.myMainMenueButtonSection.resetplaybuttonaction();
      gameRef.mainMenue.myMainMenueButtonSection.optionelementisopen = true;
      add(gameOption);
    }else
    {
      gameOption.destroy();
      gameOption = GameUIOption();
    }

  }

  destroyOption()
  {
    if(!gameOption.isMounted){
    }else {
      gameRef.mainMenue.myMainMenueButtonSection.optionelementisopen = false;
      gameOption.destroy();
      gameOption = GameUIOption();
    }
  }


  void instructions(){

  }


 void destroy()

 {
   btnsettings.destroy();
   btninstructions.destroy();
   textField.destroy();
    this.removeFromParent();
 }



}