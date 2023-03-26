



import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MyTextField extends TextComponent with HasGameRef<MySpaceGame>
{



  late TextStyle style;
  late Color _plate;

  late double _positionX;
  late double _positionY;
  late String _text;


  MyTextField(this._positionX, this._positionY, this._text, this._plate);


  @override
  Future<void> onLoad() async
  {

    parent = gameRef;
    style = TextStyle(color:  _plate, fontSize: 24);
     final regular = TextPaint(style: style);
    text = _text;
    position = Vector2(_positionX, _positionY);
    textRenderer = regular;
  }


}