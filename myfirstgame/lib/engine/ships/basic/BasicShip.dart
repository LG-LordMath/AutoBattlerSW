


import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/bullets/EnumGoodAginst.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/BulletLaserLoader.dart';
import 'package:myfirstgame/engine/bullets/lasertypes/EnumLaserList.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/ships/basic/AnimationShield.dart';
import 'package:myfirstgame/engine/ships/basic/EnumShipClass.dart';
import 'package:myfirstgame/engine/ships/basic/HealthbarShip.dart';
import 'package:myfirstgame/engine/ships/basic/ImageShip.dart';
import 'package:myfirstgame/engine/szene/menue/enums/EnumGameState.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:myfirstgame/game/backend/commander/EnumGameCommandersEffect.dart';

import '../../basics/MovementDirection.dart';
import 'effects/AnimationRocketExplosion.dart';
import '../../loader/ImageLoader.dart';
import '../../nations/EnumNation.dart';
import 'LevelShipBar.dart';

class BasicShip extends PositionComponent with HasGameRef<MySpaceGame>, CollisionCallbacks, DragCallbacks, TapCallbacks
{
  final _defaultColor = Colors.cyan;
  late int _currentteam;
  //werte vom Schiff
  late ImageShip spaceshipimage = ImageShip(this);
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
  int stunned = 0;
  //werte des images
  late Sprite _image;
  double _imagesizex = 0;
  double _imagesizey = 0;
  double _rotation = 0;
  // hp anzeige
  late Healthbar healbar;
  late Vector2 positionEnemy = Vector2(0, 0);
  late  EnumNation nation;
  late EnumShipClass shipclass;
  late int creditcost = 0;
  // checking
  bool _ishittingwall = false;
  bool _isDragged = false;
  bool _fight = false;
  late ShapeHitbox hitbox;
  int currentlevelship = 0;
  //UI
  int bottombarposition = 0;
  //MainCell
  late int mainfieldis = 0;
  late List<int> cellfields = [];

  // weapon
  late EnumLaserList laser;
  int _maxreloadtime  = 100;
  int _currentreloadtime  = 30;
  int level = 1;

  late SpriteComponent imagenation;
  late LevelShipBar shipBar;
  late SpriteComponent iconshipclass;


  //Shield

  AnimationShield animationShield = AnimationShield();


  BasicShip(this._image, this._positionx, this._positiony, this._imagesizex, this._imagesizey, this._maxhp, this._maxshieldhp, this._currentteam, this.nation, this.creditcost, this.shipclass)
  {
    _currenthp = _maxhp; _currentshieldhp = _maxshieldhp;
  }

  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    add(spaceshipimage);
    parent = gameRef;
    size = Vector2(_imagesizex, _imagesizey);
    position = Vector2(_positionx, _positiony);
    if(_currentteam == 1)
    {
      angle =  angle + _rotation;
    }
    else if (_currentteam == 2)
    {
      angle =  angle - _rotation;
    }
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = false;
    add(hitbox);
    healbar = Healthbar(_maxhp.toDouble(), _maxshieldhp.toDouble());
    add(healbar);
    addnationIcon();
    shipBar =  LevelShipBar(level);
    add(shipBar);
    if(level == 2)
    {
      currenthp = (currenthp * 1.4).toInt();
      currentshieldhp = (currentshieldhp * 1.4).toInt();
    }
    else if(level == 3)
    {
      currenthp = (currenthp * 1.8).toInt();
      currentshieldhp = (currentshieldhp * 1.8).toInt();
    }

    if(shipclass.nameofshipclass.toString()=="Fighter")
    {
      weaponrange = 100;

    }else if(shipclass.nameofshipclass.toString()=="Figatte")
    {
      weaponrange = 100;
    }else if(shipclass.nameofshipclass.toString()=="Battleship")
    {
      weaponrange = 175;
    }else if(shipclass.nameofshipclass.toString()=="Mothership")
    {
      weaponrange = 200;
    }




  }


  @override
  void update(double dt)
  {
    super.update(dt);

    if(_isDragged)
    {
      position = Vector2(positionx, positiony);
    }
    else {
      if (_currenthp > 0)
      {


        if(stunned > 0){
          stunned--;
        }else{
          if(_fight){
            healbar.init();
            healbar.updateHealBar(_currenthp.toDouble(), _currentshieldhp.toDouble());
            moveShip();
            checkifEnemyisinrange();
            if(!imagenation.isRemoved){
              imagenation.removeFromParent();
            }
            if(!iconshipclass.isRemoved){
              iconshipclass.removeFromParent();
            }


          }else
          {
            if(imagenation.isRemoved){
              addnationIcon();
            }
          }
        }


      }
      else {
        removeFromParent();
        //AnimationExplosionShip(absolutePosition);

        if (_currentteam == 1)
        {
          gameRef.gameAutoBattle.player1.team.remove(this);
          if(gameRef.gameAutoBattle.player1.commander.effect == EnumGameCommandersEffect.boostincomeEnemyshipdestroyed)
          {
            Random random = Random();
            int randomNumber = random.nextInt(11);
            if(randomNumber > 1){
            }else{
              gameRef.gameAutoBattle.player1.currentcredits ++;
            }
          }
          //gameRef.team1.remove(this);
        } else if (currentteam == 2) {
          //gameRef.team2.remove(this);
          gameRef.gameAutoBattle.player2.team.remove(this);
          if(gameRef.gameAutoBattle.player2.commander.effect == EnumGameCommandersEffect.boostincomeEnemyshipdestroyed)
          {
            Random random = Random();
            int randomNumber = random.nextInt(11);
            if(randomNumber > 1){
            }else{
              gameRef.gameAutoBattle.player2.currentcredits ++;
            }
          }
        }



      }
    }

  }

  Future<void> addnationIcon() async {
    switch(nation){
      case EnumNation.Republic:
        imagenation = SpriteComponent(size: Vector2(10, 10), position: Vector2(-10, 30), sprite: ImageLoader.sprites[EnumImages.IconRepublic]);

        break;
      case EnumNation.Rebellen:
        imagenation = SpriteComponent(size: Vector2(10, 10), position: Vector2(-10, 30), sprite: ImageLoader.sprites[EnumImages.IconRebellen]);
        break;
      case EnumNation.Imperium:
        imagenation =  SpriteComponent(size: Vector2(10, 10), position: Vector2(-10, 30), sprite: ImageLoader.sprites[EnumImages.IconImperium]);
        break;
      case EnumNation.CIS:
        imagenation = SpriteComponent(size: Vector2(10, 10), position: Vector2(-10, 30), sprite: ImageLoader.sprites[EnumImages.IconSeperatisten]);
        break;
      default:
        break;
    }
    imagenation.scale = Vector2(1, 1);
    add(imagenation);
    Sprite tempiconsprite;
    switch(shipclass) {
      case EnumShipClass.Fighter:
        tempiconsprite = await Sprite.load(EnumShipClass.Fighter.Iconpath);
        break;
      case EnumShipClass.Figatte:
        tempiconsprite = await Sprite.load(EnumShipClass.Figatte.Iconpath);
        break;
      case EnumShipClass.Battleship:
        tempiconsprite = await Sprite.load(EnumShipClass.Battleship.Iconpath);
        break;
      case EnumShipClass.Mothership:
        tempiconsprite = await Sprite.load(EnumShipClass.Mothership.Iconpath);
        break;
      case EnumShipClass.Titan:
        tempiconsprite = await Sprite.load(EnumShipClass.Titan.Iconpath);
        break;
    }
    iconshipclass = SpriteComponent(sprite: tempiconsprite,
        position:  Vector2(-10, 10),
        size: Vector2(10, 10));
    iconshipclass.scale = Vector2(1, 1);
    add(iconshipclass!);

  }

  void fighting(bool pfight)
  {
    _fight = pfight;


  }
  void checkifEnemyisinrange()
  {
     int temp = checknearenemy();
     if( temp  > _weaponrange && temp != 0 && !_ishittingwall )
     {
       if(currentteam == 1)
       {
         if (positionEnemy.y < positiony &&
             (positionEnemy.y - positiony).toInt() < 0) {
           _movment = MovementDirection.moveright;
         }else if (positionEnemy.x > positionx &&
             (positionEnemy.x - positionx).toInt() > 0) {
           _movment = MovementDirection.movedown;
         }
         else if (positionEnemy.x < positionx &&
             (positionEnemy.x - positionx).toInt() < 0) {
           _movment = MovementDirection.moveup;
         } else if (positionEnemy.y > positiony &&
             (positionEnemy.y - positiony).toInt() > 0) {
           _movment = MovementDirection.moveleft;
         } else {
           _movment = MovementDirection.no;
         }

       }else {
         if (positionEnemy.y > positiony &&
             (positionEnemy.y - positiony).toInt() > 0) {
           _movment = MovementDirection.moveleft;
         }
         else if (positionEnemy.x < positionx &&
             (positionEnemy.x - positionx).toInt() < 0) {
           _movment = MovementDirection.moveup;
         }
         else if (positionEnemy.y < positiony &&
             (positionEnemy.y - positiony).toInt() < 0) {
           _movment = MovementDirection.moveright;
         }
         else if (positionEnemy.x > positionx &&
             (positionEnemy.x - positionx).toInt() > 0) {
           _movment = MovementDirection.movedown;
         } else {
           _movment = MovementDirection.no;
         }
       }
    }else if(temp < _weaponrange  && !_ishittingwall)
    {
       shootEnemy();
       _movment  = MovementDirection.no;
     }
  }


  void shootEnemy()
  {
    if(_currentreloadtime <= 0)
    {
      IBasicBullet tempbullet = BulletLaserLoader.lasers[laser]!;
      add(tempbullet);
      if(_currentteam == 1)
      {
        tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, _currentteam);
        if(gameRef.gameAutoBattle.player1.commander.effect == EnumGameCommandersEffect.boostreloadtime)
        {
          _currentreloadtime = _maxreloadtime - (_maxreloadtime * 0.1).toInt();
        }else{
          _currentreloadtime = _maxreloadtime ;
        }
      }else{
        tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, _currentteam);
        if(gameRef.gameAutoBattle.player2.commander.effect == EnumGameCommandersEffect.boostreloadtime)
        {
          _currentreloadtime = _maxreloadtime - (_maxreloadtime * 0.1).toInt();
        }else{
          _currentreloadtime = _maxreloadtime ;
        }
      }
      gameRef.bulletLaserLoader.reloadObject(laser);
    }else{
      _currentreloadtime--;
    }
  }

  int checknearenemy()
  {
    int enemyrange = 0;
    int enemycounter = 0;
   // print(gameRef.team1.length.toString()+ " | "+gameRef.team2.length.toString());
    if(_currentteam == 1)
    {
      if(gameRef.gameAutoBattle.player2.team.isNotEmpty){
        for(int i = 0; i <gameRef.gameAutoBattle.player2.team.length ; i++)
        {
          if( gameRef.gameAutoBattle.player2.team.elementAt(i).absolutePosition.x > 0 && gameRef.gameAutoBattle.player2.team.elementAt(i).absolutePosition.y > 0  ){
            Vector2 temp =  gameRef.gameAutoBattle.player2.team.elementAt(i).absolutePosition;
            var resges =  distanceTo(temp);

            if(resges.toInt() >= enemyrange && enemyrange!=0){

            }else if(enemyrange == 0){
              enemyrange = resges.toInt();
            }else{
              enemyrange = resges.toInt();
              enemycounter = i;
            }
          }

        }
        positionEnemy = gameRef.gameAutoBattle.player2.team.elementAt(enemycounter).absolutePosition;
        positionEnemy.x -= gameRef.gameAutoBattle.player2.team.elementAt(enemycounter).width ;
        positionEnemy.y -=  gameRef.gameAutoBattle.player2.team.elementAt(enemycounter).width;

      }else{
  //      enemyrange = 0;
  //      positionEnemy = Vector2(0, 0);

      }

    }else if(_currentteam == 2)
    {
      if(gameRef.gameAutoBattle.player1.team.isNotEmpty){
        for(int i = 0; i <gameRef.gameAutoBattle.player1.team.length ; i++)
        {
          if( gameRef.gameAutoBattle.player1.team.elementAt(i).absolutePosition.x > 0 && gameRef.gameAutoBattle.player1.team.elementAt(i).absolutePosition.y > 0  ){
            Vector2 temp = gameRef.gameAutoBattle.player1.team .elementAt(i).absolutePosition;
            var resges = distanceTo(temp);

            if (resges.toInt() >= enemyrange && enemyrange != 0) {

            } else if (enemyrange == 0) {
              enemyrange = resges.toInt();
            } else {
              enemyrange = resges.toInt();
              enemycounter = i;
            }
          }
        }
        positionEnemy = gameRef.gameAutoBattle.player1.team.elementAt(enemycounter).absolutePosition;
        positionEnemy.x += gameRef.gameAutoBattle.player1.team.elementAt(enemycounter).imagesizex / 2;
        positionEnemy.y +=  gameRef.gameAutoBattle.player1.team.elementAt(enemycounter).imagesizey / 2;
      }
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

  void damage(int damage, EnumGoodAginst goodAginst)
  {
    switch (goodAginst){
      case EnumGoodAginst.no:
        break;
      case  EnumGoodAginst.shield:
         damage = damage * goodAginst.damagemulti;
        break;
      case  EnumGoodAginst.hp:
        damage = damage * goodAginst.damagemulti;
        break;
      case  EnumGoodAginst.both:
        damage = damage * goodAginst.damagemulti;
        break;
    }
    if(_fight)
    {
      if(_currentshieldhp > 0 && _currentshieldhp != 0)
      {
        if(damage > _currentshieldhp)
        {
          animationShield.position = Vector2(imagesizex/ 8, 0);
          add(animationShield);
          _currentshieldhp = 0;
          _currenthp = _currenthp - (damage - _currentshieldhp);
          animationShield.removeOnFinish;
        }
        else
        {
          _currentshieldhp -= damage;
        }
      }else{
        _currenthp -= damage;
      //  print(this.toString() + " HP: " + _currenthp.toString());
      }

    }

  }

  void rotateImage()
  {
    spaceshipimage.rotateImage();

  }


  void setPosition(Vector2 ppos)
  {
    positionx = ppos.x;
    positiony = ppos.y;
    position = ppos;
  }


  @override
  void onDragStart(DragStartEvent event) {
    // Do something in response to a drag event
    if(_fight)
    {
    }
    else
    {
      if(_currentteam == 1){
        positionx = position.x;
        positiony  = position.y;
        _isDragged = true;
        gameRef.gameAutoBattle.player1.team.remove(this);
        gameRef.gameAutoBattle.map.maincells[mainfieldis].releaseCellsAndMap(cellfields , this);
        gameRef.gameAutoBattle.bottomBar.tempships.remove(this);
        if(gameRef.gameAutoBattle.shopMenue.isMounted)
        {
          gameRef.gameAutoBattle.openOrcloseShop();
        }

      }else {
        gameRef.gameAutoBattle.ennemymap.maincells[mainfieldis].releaseCellsAndMap(cellfields , this);
      }


    }

  }

  @override
  void onDragUpdate(DragUpdateEvent event)
  {
    if(positiony < gameRef.size[1] / 1.2)
    {
      //print(position.toString() + " " +gameRef.size.toString());
      scale = Vector2(shipclass.CellsizeX.toDouble(), shipclass.CellsizeY.toDouble());
    }
    else
    {
      scale = Vector2(1, 1);
    }
    if(_fight || currentteam != 1)
    {

    }
    else
    {
      positionx += event.delta.x;
      positiony += event.delta.y;
     // print(position.toString());

      switch(bottombarposition)
      {
        case 1:
          gameRef.gameAutoBattle.bottomBar.fieldOneismanned = false;
          break;
        case 2:
          gameRef.gameAutoBattle.bottomBar.fieldTwoismanned = false;
          break;
        case 3:
          gameRef.gameAutoBattle.bottomBar.fieldThreeismanned = false;
          break;
        case 4:
          gameRef.gameAutoBattle.bottomBar.fieldFourismanned = false;
          break;
        case 5:
          gameRef.gameAutoBattle.bottomBar.fieldFiveismanned = false;
          break;
      }
      bottombarposition = 0;
    }
  }

  void setBottonBarPosition(int bottonposition)
  {
      bottombarposition = bottonposition;
  }


  @override
  void onDragEnd(DragEndEvent event) {
    if(_fight ||currentteam != 1){

    }else {
      _isDragged = false;
      position = Vector2(positionx, positiony);
      if(positiony < gameRef.size[1] / 1.2)
      {
        gameRef.gameAutoBattle.map.addShip(this);

      }else{
        scale = Vector2(1, 1);
        gameRef.gameAutoBattle.bottomBar.addShipToBar(this);


      }



    }
  }
  @override
  void onLongTapDown(TapDownEvent event)
  {
   if(gameRef.gameAutoBattle.gameState != EnumGameState.FIGHTPHASE && currentteam == 1)
   {
     if(gameRef.gameAutoBattle.shopMenue.isMounted)
     {
       gameRef.gameAutoBattle.openOrcloseShop();
     }

     gameRef.gameAutoBattle.sellShip(this);
   }
  }



  @override
  void onDragCancel(DragCancelEvent event)
  {
      scale = Vector2(1, 1);
      gameRef.gameAutoBattle.bottomBar.addShipToBar(this);
  }
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other)
  {

    super.onCollisionStart(intersectionPoints, other);
    if (other is ScreenHitbox) {

      _ishittingwall = true;
      print("wall hitting " + _ishittingwall.toString());
      switch (_movment) {
        case MovementDirection.moveup:
         _movment =   MovementDirection.movedown;
          break;
        case MovementDirection.movedown:
          _movment =   MovementDirection.moveup;
          break;
        case MovementDirection.moveleft:
          _movment =  MovementDirection.moveright;
          break;
        case MovementDirection.moveright:
          _movment =  MovementDirection.moveleft;
          break;
        default:
          break;

      }
    }else if(other is BasicShip)
    {

    }
    else {
      _ishittingwall = false;
    }
  }
  @override
  void onCollisionEnd(PositionComponent other)
  {
    super.onCollisionEnd(other);
    if (other is ScreenHitbox) {
     // print("end hitting");
      _ishittingwall = false;
    }
    if (!isColliding) {
      if (other is ScreenHitbox) {
      //  print("end hitting");
        _ishittingwall = false;
      }
    }
    if (other is IBasicBullet) {
      //print("collosion with bullet");
      if (other.team == currentteam) {
        //print("same team");
      } else {
        //print(" hit ");
         damage(other.damage, other.goodAginst);
      //  damage(other.damage, EnumGoodAginst.hp);
        // AnimationRocketExplosion rocketExplosion = AnimationRocketExplosion();
         //rocketExplosion.position = absolutePosition;
      //   rocketExplosion.size = Vector2(50,50);
         add(AnimationRocketExplosion());
        other.removeFromParent();
      }
    }else if(other is IoncanonBullet)
    {
      if (other.team == currentteam) {

      }else{

        stunned = other.stuneffect;
        currentshieldhp = 0;
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

  //List<BasicWeaponCanon> get weapons => _weapons;


  Sprite get getimage => _image;

  set image(Sprite value) {
    _image = value;
  }

  double get weaponrange => _weaponrange;

  set weaponrange(double value) {
    _weaponrange = value;
  }

  int get maxshieldhp => _maxshieldhp;

  set maxshieldhp(int value) {
    _maxshieldhp = value;
  }

  int get maxhp => _maxhp;

  set maxhp(int value) {
    _maxhp = value;
  }

  bool get fight => _fight;

  set fight(bool value) {
    _fight = value;
  }

  int get currentshieldhp => _currentshieldhp;

  set currentshieldhp(int value) {
    _currentshieldhp = value;
  }

  int get currenthp => _currenthp;

  set currenthp(int value) {
    _currenthp = value;
  }

  void destroy()
  {

    spaceshipimage.removeFromParent();

    spaceshipimage.destroy();
    shipBar.destroy();
    //removeFromParent();
  }


}




