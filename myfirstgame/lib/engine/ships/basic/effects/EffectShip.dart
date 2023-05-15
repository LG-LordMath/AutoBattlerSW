


import 'dart:math';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/other/BulletSpecialLoader.dart';
import 'package:myfirstgame/engine/bullets/other/EnumSpecialList.dart';
import 'package:myfirstgame/engine/bullets/other/IoncanonBullet.dart';
import 'package:myfirstgame/engine/bullets/rockets/EnumRocketList.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/basic/LoaderShips.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EnumEffects.dart';

import '../../../bullets/IBasicBullet.dart';
import '../../../bullets/rockets/BulletRocketLoader.dart';

class EffectShip extends BasicShip


{

  EnumEffects effects = EnumEffects.none;

  int _maxeffecttimer = 100;
  late int _effecktimer;

  List<BasicShip> childships = [];


  EffectShip(super.image, super.positionx, super.positiony, super.imagesizex, super.imagesizey, super.maxhp, super.maxshieldhp, super.currentteam, super.nation, super.creditcost, super.shipclass);



  void setEffect(EnumEffects enumEffects, int effecttimer)
  {
    effects = enumEffects;
    _effecktimer = effecttimer;
    _effecktimer =  _maxeffecttimer;
  }


  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(super.fight)
    {
      if(_effecktimer<=0)
      {
        if(stunned>0)
        {

        }else{
          activateeffect();
          _effecktimer = _maxeffecttimer;
        }

      }
      _effecktimer--;
    }


  }

  void activateeffect()
  {
    switch(effects)
    {
      case EnumEffects.heal:
        super.hp += 300;
        break;
      case EnumEffects.masterheal:
        if(super.currentteam==1){
          gameRef.gameAutoBattle.player1.team.forEach((element) {
            element.hp+=500;
          });
        }
        break;
      case EnumEffects.shootIonenCanon:
        switch(super.level){
          case 1:
            IoncanonBullet ioncanonBullet = BulletSpecialLoader.special[EnumSpecialList.IoncanonShootSmall]!;
            add(ioncanonBullet);
            if(super.currentteam == 1){
              ioncanonBullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }else{
              ioncanonBullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }
            BulletSpecialLoader bulletSpecialLoader = BulletSpecialLoader();
            bulletSpecialLoader.reloadObject(EnumSpecialList.IoncanonShootSmall);
            break;
          case 2:
            IoncanonBullet ioncanonBullet = BulletSpecialLoader.special[EnumSpecialList.IoncanonShootMedium]!;
            add(ioncanonBullet);
            if(super.currentteam == 1){
              ioncanonBullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }else{
              ioncanonBullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }
            BulletSpecialLoader bulletSpecialLoader = BulletSpecialLoader();
            bulletSpecialLoader.reloadObject(EnumSpecialList.IoncanonShootMedium);
            break;
          case 3:
            IoncanonBullet ioncanonBullet = BulletSpecialLoader.special[EnumSpecialList.IoncanonShootBig]!;
            add(ioncanonBullet);
            if(super.currentteam == 1){
              ioncanonBullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }else{
              ioncanonBullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
            }
            BulletSpecialLoader bulletSpecialLoader = BulletSpecialLoader();
            bulletSpecialLoader.reloadObject(EnumSpecialList.IoncanonShootBig);
            break;
        }

        break;
      case EnumEffects.shootRocketOne:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketOne]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
      gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketOne);
        break;
      case EnumEffects.shootRocketTwo:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketTwo]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
        gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketTwo);
        break;
      case EnumEffects.shootRocketThree:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketThree]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
        gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketThree);
        break;
      case EnumEffects.spawnfighter:
        switch(super.level)
        {
          case 1:
            if(childships.isEmpty)
            {
              spawnChildShip();
            }
            break;
          case 2:
            if(childships.isEmpty)
            {
              spawnChildShip();
              spawnChildShip();
            }else if(childships.length < 2){
              spawnChildShip();
            }
            break;
          case 3:
            if(childships.isEmpty)
            {
              spawnChildShip();
              spawnChildShip();
              spawnChildShip();
            }else if(childships.length < 3){
              spawnChildShip();
              spawnChildShip();
            }else if(childships.length < 2){
              spawnChildShip();
            }
            break;
        }
        break;

    }
  }

  void spawnChildShip()
  {
    if(super.nation == EnumNation.Republic)
    {
      Random random = new Random();
      int randomNumber = random.nextInt(3);
      switch(randomNumber){
        case 0:
          BasicShip ship  = LoaderShips.getNewShip();
          break;
        case 1:

          break;
        case 2:

          break;
      }

    }

  }


  void removeAllSpawnShips()
  {

  }










}