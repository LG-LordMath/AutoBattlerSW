


import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/bullets/NormalBullet.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/HealthbarShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../main.dart';
import '../basics/MovementDirection.dart';
import '../basics/Trail.dart';

class BasicShip extends SpriteComponent with HasGameRef<MySpaceGame>, CollisionCallbacks, DragCallbacks
{
  final _defaultColor = Colors.cyan;

  late int _currentteam;

  //werte vom Schiff
  int _shipid = 0;
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

  // hp anzeige
  late Healthbar healbar;


  //enemy
  int _maxammonition = 1;
  int _maxreloadtime  = 80;
  int _currentreloadtime  = 0;
  int _currentamonition =1;
  late Vector2 positionEnemy = Vector2(0, 0);
  bool _isDragged = false;
  bool _fight = false;

  BasicShip(this._shipid, this._imagepath, this._positionx, this._positiony, this._imagesizex, this._imagesizey, this._maxhp, this._maxshieldhp, this._currentteam)
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
   // angle =  angle + _rotation;
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    ShapeHitbox hitbox = RectangleHitbox()
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

    if(_isDragged){
      position = Vector2(positionx, positiony);

    }else {

      if (_currenthp > 0)
      {
        if(_fight){
          healbar.init();
          healbar.updateHealBar(_currenthp.toDouble(), _currentshieldhp.toDouble());
          moveShip();
          checkifEnemyisinrange();
        }

      }
      else {
        super.removeFromParent();
        if (_currentteam == 1) {
          gameRef.team1.remove(this);
        } else if (currentteam == 2) {
          gameRef.team2.remove(this);
        }
      }


    }

  }

  void fighting(bool pfight)
  {
    _fight = pfight;

  }


  void shootEnemy()
  {
    if(_currentamonition == 0 ){
      _currentreloadtime--;
    }
    if(_currentreloadtime == 0){
      _currentamonition = _maxammonition;
      _currentreloadtime = _maxreloadtime;
    }
    if(_currentamonition > 0 ){
        //print("Ship position: " + position.toString());
      if (positionEnemy.x != 0 && positionEnemy.y != 0) {
        add(NormalBullet(position , positionEnemy, _currentteam));
        _currentamonition--;

      }

    }

  }

  void checkifEnemyisinrange()
  {
     int temp = checknearenemy();
     if( temp >= _weaponrange && temp != 0) {
     //print("move: " + temp.toString() + " | " + _weaponrange.toString());

      if(positionEnemy.x < positionx){
        _movment  = MovementDirection.moveup;
      } else if(positionEnemy.x > positionx){
        _movment  = MovementDirection.movedown;
      } if(positionEnemy.y < positiony){
        _movment  = MovementDirection.moveright;
      } if(positionEnemy.y > positiony){
        _movment  = MovementDirection.moveleft;
      }

    }else {
       shootEnemy();
        _movment  = MovementDirection.no;

     }
  }


  int checknearenemy()
  {
    int enemyrange = 0;
    int enemycounter = 0;
   // print(gameRef.team1.length.toString()+ " | "+gameRef.team2.length.toString());
    if(_currentteam == 1)
    {
      if(gameRef.team2.isNotEmpty){
        for(int i = 0; i <gameRef.team2.length ; i++)
        {
          Vector2 temp =  gameRef.team2.elementAt(i).position;
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

      }else{
        enemyrange = 0;
        positionEnemy = Vector2(0, 0);

      }

    }else if(_currentteam == 2)
    {
      if(gameRef.team1.isNotEmpty){
        for(int i = 0; i <gameRef.team1.length ; i++)
        {
          Vector2 temp =  gameRef.team1.elementAt(i).position;
          var resges =  distanceTo(temp);

          if(resges.toInt() >= enemyrange && enemyrange!=0){

          }else if(enemyrange == 0){
            enemyrange = resges.toInt();
          }else{
            enemyrange = resges.toInt();
            enemycounter = i;
          }
        }
        positionEnemy = gameRef.team1.elementAt(enemycounter).position;

      }else{
        enemyrange = 0;
        positionEnemy = Vector2(0, 0);

      }
    }else
    {
      enemyrange = 0;
      positionEnemy = Vector2(0, 0);
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
  void onDragStart(DragStartEvent event) {
    // Do something in response to a drag event
    if(_fight){

    }else{
      _isDragged = true;
      priority = 10;
    }

  }

  @override
  void onDragUpdate(DragUpdateEvent event)
  {
    if(_fight){

    }else {
      positionx += event.delta.x;
      positiony += event.delta.y;
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    if(_fight){

    }else {
      _isDragged = false;
      priority = 0;
      position = Vector2(positionx, positiony);
    }
  }

  @override
  void onDragCancel(DragCancelEvent event) {

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
    else if(other is NormalBullet)
    {
      if(other.team == _currentteam){

      }else{
        _currenthp -= other.damage;
      }
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

  int get currentteam => _currentteam;

  set currentteam(int value) {
    _currentteam = value;
  }
}




