


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
import 'package:myfirstgame/engine/ships/galacticempireships/EnumGalaticEmpireShips.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/GalacticEmpireShipsLoader.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SeperatistCISShipLoader.dart';

import '../../../../game/backend/commander/EnumGameCommandersEffect.dart';
import '../../../bullets/IBasicBullet.dart';
import '../../../bullets/rockets/BulletRocketLoader.dart';
import '../../republicships/RepublicShipsLoader.dart';

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
          if(super.currentteam == 1){
            if(gameRef.gameAutoBattle.player1.commander.effect == EnumGameCommandersEffect.boostreloadtime)
            {
              _effecktimer = _maxeffecttimer - (_maxeffecttimer * 0.1).toInt();
            }else{
              _effecktimer = _maxeffecttimer;
            }
          }else{
            if(gameRef.gameAutoBattle.player2.commander.effect == EnumGameCommandersEffect.boostreloadtime)
            {
              _effecktimer = _maxeffecttimer - (_maxeffecttimer * 0.1).toInt();
            }else{
              _effecktimer = _maxeffecttimer;
            }
          }




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
        if(childships.isEmpty)
        {
          switch(super.level)
          {

            case 1:
              spawnChildShip();
              break;
            case 2:
              spawnChildShip();
              break;
            case 3:
              spawnChildShip();
              break;
          }
        }
        break;

    }
  }

  void spawnChildShip()
  {

    if(super.nation == EnumNation.Republic)
    {
      RepublicShipsLoader rep = RepublicShipsLoader();
      switch(super.level)
      {
        case 1:
          BasicShip ship;
          ship =  RepublicShipsLoader.republicships[EnumRepublicShips.ARC170]!;
          rep.reloadObject(EnumRepublicShips.ARC170);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          break;
        case 2:
          BasicShip ship;
          ship =  RepublicShipsLoader.republicships[EnumRepublicShips.ARC170]!;
          rep.reloadObject(EnumRepublicShips.ARC170);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1){

            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          BasicShip shiptwo;
          shiptwo =  RepublicShipsLoader.republicships[EnumRepublicShips.YWing]!;
          rep.reloadObject(EnumRepublicShips.YWing);
          gameRef.add(shiptwo);
          shiptwo.fighting(true);
          shiptwo.rotateImage();
          shiptwo.currentteam = super.currentteam;
          shiptwo.setPosition(Vector2(super.position.x + 25, super.position.y));
          childships.add(shiptwo);
          if(shiptwo.currentteam == 1){

            gameRef.gameAutoBattle.player1.team.add(shiptwo);
          }else{
            gameRef.gameAutoBattle.player2.team.add(shiptwo);
          }
          break;
        case 3:
          BasicShip ship;
          ship =  RepublicShipsLoader.republicships[EnumRepublicShips.ARC170]!;
          rep.reloadObject(EnumRepublicShips.ARC170);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          BasicShip shiptwo;
          shiptwo =  RepublicShipsLoader.republicships[EnumRepublicShips.YWing]!;
          rep.reloadObject(EnumRepublicShips.YWing);
          gameRef.add(shiptwo);
          shiptwo.fighting(true);
          shiptwo.rotateImage();
          shiptwo.currentteam = super.currentteam;
          shiptwo.setPosition(Vector2(super.position.x + 25, super.position.y));
          childships.add(shiptwo);
          if(shiptwo.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(shiptwo);
          }else{
            gameRef.gameAutoBattle.player2.team.add(shiptwo);
          }
          BasicShip shipthree;
          shipthree =  RepublicShipsLoader.republicships[EnumRepublicShips.Z95]!;
          rep.reloadObject(EnumRepublicShips.Z95);
          gameRef.add(shipthree);
          shipthree.fighting(true);
          shipthree.rotateImage();
          shipthree.currentteam = super.currentteam;
          shipthree.setPosition(Vector2(super.position.x - 25, super.position.y));
          childships.add(shipthree);
          if(shipthree.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(shipthree);
          }else{
            gameRef.gameAutoBattle.player2.team.add(shipthree);
          }
          break;
      }

    }else if(super.nation == EnumNation.Imperium)
    {
      GalaticEmpireShipsLoader geloader = GalaticEmpireShipsLoader();
      switch(super.level)
      {
        case 1:
          BasicShip ship;
          ship =  GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.Tie]!;
          geloader.reloadObject(EnumGalaticEmpireShips.Tie);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          break;
        case 2:
          BasicShip ship;
          ship =  GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.Tie]!;
          geloader.reloadObject(EnumGalaticEmpireShips.Tie);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          break;
        case 3:
          BasicShip ship;
          ship =  GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.Tie]!;
          geloader.reloadObject(EnumGalaticEmpireShips.Tie);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          break;
      }
    }else if(super.nation == EnumNation.CIS)
    {
      SeperatistCISShipLoader geloader = SeperatistCISShipLoader();
      switch(super.level)
      {
        case 1:
          BasicShip ship;
          ship =  SeperatistCISShipLoader.cisships[EnumCISShips.Valture]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          break;
        case 2:
          BasicShip ship;
          ship =  SeperatistCISShipLoader.cisships[EnumCISShips.Valture]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          BasicShip tempship;
          tempship =  SeperatistCISShipLoader.cisships[EnumCISShips.Hyaenen]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(tempship);
          tempship.fighting(true);
          tempship.rotateImage();
          tempship.currentteam = super.currentteam;
          tempship.setPosition(super.position);
          childships.add(tempship);
          if(tempship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(tempship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(tempship);
          }
          break;
        case 3:
          BasicShip ship;
          ship =  SeperatistCISShipLoader.cisships[EnumCISShips.Valture]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(ship);
          ship.fighting(true);
          ship.rotateImage();
          ship.currentteam = super.currentteam;
          ship.setPosition(super.position);
          childships.add(ship);
          if(ship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(ship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(ship);
          }
          BasicShip tempship;
          tempship =  SeperatistCISShipLoader.cisships[EnumCISShips.Hyaenen]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(tempship);
          tempship.fighting(true);
          tempship.rotateImage();
          tempship.currentteam = super.currentteam;
          tempship.setPosition(super.position);
          childships.add(tempship);
          if(tempship.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(tempship);
          }else{
            gameRef.gameAutoBattle.player2.team.add(tempship);
          }
          BasicShip tempship2;
          tempship2 =  SeperatistCISShipLoader.cisships[EnumCISShips.SRPDroid]!;
          geloader.reloadObject(EnumCISShips.Valture);
          gameRef.add(tempship2);
          tempship2.fighting(true);
          tempship2.rotateImage();
          tempship2.currentteam = super.currentteam;
          tempship2.setPosition(super.position);
          childships.add(tempship2);
          if(tempship2.currentteam == 1)
          {
            gameRef.gameAutoBattle.player1.team.add(tempship2);
          }else{
            gameRef.gameAutoBattle.player2.team.add(tempship2);
          }
          break;
      }
    }

  }


  void removeAllSpawnShips()
  {
    if(childships.isNotEmpty)
    {
      childships.forEach((element)
      {
        childships.remove(element);
        element.destroy();
        element.removeFromParent();

      });
    }

  }










}