


import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../basics/textfield/MyTextField.dart';

class MyUIText extends SpriteComponent with HasGameRef<MySpaceGame>
{

  late Sprite _image ;
  double _imagesizex = 50;
  double _imagesizey = 50;
  late Vector2 positionofButton;
  late String _text;
  late MyTextField textField;
  late Color _color;


  MyUIText(this._image, this._imagesizex, this._imagesizey, this.positionofButton, this._text, this._color);



  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    sprite = _image;
    size = Vector2(_imagesizex, _imagesizey);
    position = positionofButton;
    parent = gameRef;
    textField = MyTextField(positionofButton.x + _imagesizex / 8  ,positionofButton.y + _imagesizey / 4  ,  _text, _color);

    add(textField);
  }

  setText(String text)
  {
    textField.text = text;

    textField.position = Vector2(positionofButton.x + _imagesizex / 2.5  ,positionofButton.y + _imagesizey / 3);
  }

  destroy()
  {
    textField.destroy();
    gameRef.remove(this);
  }

}