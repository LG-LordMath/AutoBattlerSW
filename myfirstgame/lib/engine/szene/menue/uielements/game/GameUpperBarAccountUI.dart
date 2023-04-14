

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/player/Player.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class GameUpperBarAccountUI extends SpriteComponent


{

  late Player player;
  late double sizeX;
  late double positionX;
  late ColorEffect effect;

  late int _currenthp;
  late int _currentcredits;
  late MyTextField textField;
  late  MyTextField textField1;

  GameUpperBarAccountUI(this.player, this.sizeX, this.positionX, this.effect);

  @override
  Future<void> onLoad() async

  {
    sprite = ImageLoader.sprites[EnumImages.UICardOne];
    size = Vector2(sizeX, 80);
    position = Vector2(positionX, 10);

    Sprite? sp = Sprite(await Flame.images.load(player.image.imagepath));
    SpriteComponent spriteComponent = SpriteComponent(sprite: sp, position: Vector2(10, 10), size: Vector2(sizeX / 3, 50) );
    add(spriteComponent);

    _currenthp = player.hp;
    _currentcredits = player.currentcredits;

    textField = MyTextField(positionX + sizeX /  2, 20, "Hp: "+ _currenthp.toString(), Colors.white);
  //  textField.style = TextStyle(color:  Colors.white, fontSize: 20);
    textField1 = MyTextField(positionX + sizeX /  2, 50, "[R]: "+ _currentcredits.toString(), Colors.white);
   // textField1.style = TextStyle(color:  Colors.white, fontSize: 20);
    add(textField);
    add(textField1);
    add(effect);
  }

  @override
  void update(double dt){
    super.update(dt);
    if(_currenthp != player.hp)
    {
      _currenthp = player.hp;
      textField.text = "Hp: "+ _currenthp.toString();

    }
    if(_currentcredits != player.currentcredits)
    {
      _currentcredits = player.currentcredits;
      textField1.text =  "[R]: "+ _currentcredits.toString();

    }
  }


}