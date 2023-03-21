


import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/HealthbarShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../main.dart';
import '../basics/MovementDirection.dart';

class BasicShip extends SpriteComponent with HasGameRef<MySpaceGame>, CollisionCallbacks
{
  final _defaultColor = Colors.cyan;

  late int _currentteam;

  //werte vom Schiff
  bool _isenable  = true;
  int _maxhp = 0;
  int _maxshieldhp = 0;
  late int _currenthp;
  late int _currentshieldhp;
  int _movementspeed = 2;
  double _positionx = 0;
  double _positiony = 0;
  MovementDirection _movment  = MovementDirection.no;
  double _weaponrange = 200;

  //werte des images
  String _imagepath = '';
  double _imagesizex = 0;
  double _imagesizey = 0;
  double _rotation = 0.1;

  bool hasCollided = false;
  // hp anzeige
  late Healthbar healbar;


  //enemy
  Vector2 positionEnemy = Vector2(0, 0);


  BasicShip(this._imagepath, this._positionx, this._positiony, this._imagesizex, this._imagesizey, this._maxhp, this._maxshieldhp, this._currentteam)
  {_currenthp = _maxhp; _currentshieldhp = _maxshieldhp;}




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


    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;


    ShapeHitbox hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);

    healbar = Healthbar(_maxhp.toDouble(), _maxshieldhp.toDouble());



    add(healbar);




  }


  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    healbar.updateHealBar(_currenthp.toDouble(), _currentshieldhp.toDouble());
    moveShip();
    if(_currenthp > 0){
    }else{
      super.removeFromParent();
    }

    checkifEnemyisinrange();



  }

  void checkifEnemyisinrange()
  {
     int temp = checknearenemy();
    if( temp > _weaponrange) {
      print("move: " + temp.toString() + " | " + _weaponrange.toString());
      _movment  = MovementDirection.moveleft;
    }else{
      _movment  = MovementDirection.no;
    }
  }


  int checknearenemy()
  {
    int enemyrange = 0;
    int enemycounter = 0;
    if(_currentteam == 1)
    {
        for(int i = 0; i <gameRef.team2.length ; i++)
        {
          Vector2 temp =  gameRef.team2.elementAt(i).position - Vector2(positionx, positiony);
          var resges =  distanceTo(temp);

          if(resges.toInt() >= enemyrange && enemyrange!=0){

          }else if(enemyrange == 0){
            enemyrange = resges.toInt();
          }else{
            enemyrange = resges.toInt();
            enemycounter = i;
          }
       }
      positionEnemy = gameRef.team2.elementAt(enemycounter).position;
      gameRef.team2.elementAt(enemycounter)._currentshieldhp  = 50;



    }else if(_currentteam == 2)
    {

    }else
    {

    }
    return (enemyrange);
  }
  double distanceTo(Vector2 vec) {
    double dx = positionx - vec.x;               //calculate the diffrence in x-coordinate
    double dy = positiony - vec.y;               //calculate the diffrence in y-coordinate
    return sqrt(dx*dx + dy*dy);     //use the distance formula to find the difference
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


  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is ScreenHitbox) {
      _movementspeed = 0;
    }
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

  int get hp => _maxhp;

  set hp(int value) {
    _maxhp = value;
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


