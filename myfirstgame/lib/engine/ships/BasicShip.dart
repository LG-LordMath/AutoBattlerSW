


import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/MovementDirection.dart';
class BasicShip extends SpriteComponent with HasGameRef, CollisionCallbacks
{

  //werte vom Schiff
  bool _isenable  = true;
  int _hp = 0;
  int _movementspeed = 1;
  double _positionx = 0;
  double _positiony = 0;
  MovementDirection _movment  = MovementDirection.no;


  //werte des images
  String _imagepath = '';
  double _imagesizex = 0;
  double _imagesizey = 0;

  double _rotation = 0.5;





  BasicShip(String pimagepath, double pposX, double pposY,
      double pisizeX, double pisizeY)
  {
    _imagepath = pimagepath;
    _positionx = pposX;
    _positiony = pposY;
    _imagesizex = pisizeX;
    _imagesizey = pisizeY;

  }
  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    if(_imagepath.isNotEmpty){
      sprite = await gameRef.loadSprite(_imagepath);
    }
    size = Vector2(_imagesizex, _imagesizey);
    position = Vector2(_positionx, _positiony);



    angle =  angle + _rotation;

  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    moveShip();


  }


  void moveShip() {
    switch (_movment) {
      case MovementDirection.moveup:

        positionx -= movementspeed;
        break;
      case MovementDirection.movedown:
        positionx += movementspeed;
        break;
      case MovementDirection.moveleft:
        positiony += movementspeed;
        break;
      case MovementDirection.moveright:
        positiony -= movementspeed;
        break;
      case MovementDirection.no:
        break;

    }
    position = Vector2(positionx, positiony);
  }




  void positionship(double x, double y){
    _positionx = x;
    _positiony = y;
  }
  void imagesize(double x, double y){
    _imagesizex = x;
    _imagesizey = y;
  }

  int get movementspeed => _movementspeed;

  set movementspeed(int value) {
    _movementspeed = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  bool get isenable => _isenable;

  set isenable(bool value) {
    _isenable = value;
  }

  String get imagepath => _imagepath;

  set imagepath(String value) {
    _imagepath = value;
  }

  double get imagesizey => _imagesizey;

  set imagesizey(double value) {
    _imagesizey = value;
  }

  double get imagesizex => _imagesizex;

  set imagesizex(double value) {
    _imagesizex = value;
  }

  double get positiony => _positiony;

  set positiony(double value) {
    _positiony = value;
  }

  double get positionx => _positionx;

  set positionx(double value) {
    _positionx = value;
  }

  double get rotation => _rotation;

  set rotation(double value) {
    _rotation = value;
  }

  MovementDirection get movment => _movment;

  set movment(MovementDirection value) {
    _movment = value;
  }
}
