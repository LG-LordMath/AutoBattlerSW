

import 'dart:ui';

import 'package:flame/components.dart';
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


  GameUpperBarAccountUI(this.player, this.sizeX, this.positionX);

  @override
  Future<void> onLoad() async

  {
    sprite = ImageLoader.sprites[EnumImages.UICardOne];
    size = Vector2(sizeX, 80);
    position = Vector2(positionX, 10);

    Sprite? sp = Sprite(await Flame.images.load(player.image.imagepath));
    SpriteComponent spriteComponent = SpriteComponent(sprite: sp, position: Vector2(10, 10), size: Vector2(sizeX / 3, 50) );
    add(spriteComponent);

    MyTextField textField = MyTextField(positionX + sizeX /  2, 40, "Hp: "+player.hp.toString(), Colors.black);
    add(textField);
  }



}