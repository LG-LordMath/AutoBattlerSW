

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';

class GameTimer extends TimerComponent

{
  late Vector2 _positionofui;
  late MyUIText text;
  late double _time;
  //GameTimer(this._positionofui, {required super.period});

    GameTimer(this._positionofui, this._time) : super(period: _time);

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
    int timer = _time.toInt() -    super.timer.current.toInt();
    text.setText( timer.toString());
  }

  void setTime(double time) {
    timer.update(time);
  }

  void destroy(){
    text.destroy();
    removeFromParent();
  }
}