



import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class Button extends SpriteComponent with Tappable, HasGameRef<MySpaceGame>

{
  late Sprite _image ;
  double _imagesizex = 50;
  double _imagesizey = 50;
  late Vector2 positionofButton;
  late Function methode;
  late String _text;
  late MyTextField textField;

  Button(this._image, this._imagesizex, this._imagesizey, this.positionofButton, this.methode, this._text);

  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    sprite = _image;
    size = Vector2(_imagesizex, _imagesizey);
    position = positionofButton;
    parent = gameRef;
    textField = MyTextField(positionofButton.x + _imagesizex / 8  ,positionofButton.y + _imagesizey / 4  ,  _text, Colors.white);

    add(textField);


  }
  @override
  bool onTapDown(TapDownInfo event) {
    try {
      print("Button tapped"); // Add this line
      methode();
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }


  setText(String text)
  {
    textField.text = text;

    textField.position = Vector2(positionofButton.x + _imagesizex / 2.5  ,positionofButton.y + _imagesizey / 3);
  }

  setTextPosition(Vector2 pos)
  {
      textField.position = pos;
  }
  addImage(SpriteComponent image)
  {
    add(image);
  }


  destroy()
  {
    textField.destroy();
    gameRef.remove(this);
  }
  String get text => _text;

  set text(String value) {
    _text = value;
  }
}