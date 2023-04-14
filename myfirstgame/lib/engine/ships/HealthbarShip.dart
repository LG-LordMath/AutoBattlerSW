


import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class Healthbar extends Component with HasGameRef<MySpaceGame>
{
  final _barColor = Colors.black;
  final _barhealtColor = Colors.red;
  final _barShieldColor = Colors.blue;

  double _hpFromShip = 0;
  double _shielfFromShip = 0;

  late double _healtbarlength = 0;
  late double _shieldbarlength = 0;

  late RectangleComponent recshield;
  late RectangleComponent rechealth;
  late RectangleComponent rec;

  Healthbar(this._hpFromShip, this._shielfFromShip);


  @override
  Future<void> onLoad() async
  {
    final paintbar = Paint()
      ..color = _barColor
      ..style = PaintingStyle.fill;
    final healthbar = Paint()
      ..color = _barhealtColor
      ..style = PaintingStyle.fill;
    final shieldbar = Paint()
      ..color = _barShieldColor
      ..style = PaintingStyle.fill;

    rec = RectangleComponent()
      ..position = Vector2(-25, 0)
      ..size = Vector2(20, 30)
      ..paint = paintbar;
    rechealth = RectangleComponent()
      ..position = Vector2(-15, 0)
      ..size = Vector2(10, 30)
      ..paint = healthbar;
    recshield = RectangleComponent()
      ..position = Vector2(-25, 0)
      ..size = Vector2(10, 30)
      ..paint = shieldbar;


  }

  void init(){
    if(rec.isMounted && recshield.isMounted && rechealth.isMounted){

    }else {
      add(rec);
      add(recshield);
      add(rechealth);
    }
  }

  void updateHealBar(double hp, double shield)
  {
    if(_hpFromShip != 0){
      _healtbarlength = ((hp / _hpFromShip) * 30) ;
    }
    if(_shielfFromShip != 0)
    {
      _shieldbarlength = ((shield / _shielfFromShip) * 30);
    }

  }



  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    rechealth.size = Vector2(10,  _healtbarlength);

    recshield.size = Vector2(10, _shieldbarlength);
  }

  double get shielfFromShip => _shielfFromShip;

  set shielfFromShip(double value) {
    _shielfFromShip = value;
  }

  double get hpFromShip => _hpFromShip;

  set hpFromShip(double value) {
    _hpFromShip = value;
  }


}