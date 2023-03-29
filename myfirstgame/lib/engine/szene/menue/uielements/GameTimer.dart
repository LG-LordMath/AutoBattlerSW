

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';

class GameTimer extends TimerComponent

{
  late Vector2 _positionofui;
  late MyUIText text;

  GameTimer(this._positionofui, {required super.period});



  @override
  Future<void> onLoad() async
  {
    Sprite? sp = ImageLoader.sprites[EnumImages.UIIconCell];
    text = MyUIText(sp!, 50, 50, _positionofui, super.timer.current.toString(), Colors.white);
    add(text);
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    text.setText(super.timer.current.toString());
  }

  void setTime(double time) {
    timer.update(time);
  }
}