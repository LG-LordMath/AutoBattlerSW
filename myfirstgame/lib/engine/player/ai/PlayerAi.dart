



import 'dart:math';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/EnumShipClass.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import '../../nations/EnumNation.dart';
import '../../nations/EnumNation.dart';
import '../../szene/menue/uielements/game/gameshop/ShopLogic.dart';
import '../EnumPlayerImages.dart';
import '../Player.dart';

class PlayerAi extends Player

{

  late EnumNation nation;
  late ShopLogic shopLogic;
  late List<BasicShip> tempshipshopbuyed;
  late MySpaceGame game;

  // ship size
   int _maxshipfighter = 0;
   int _maxshipbattleship = 0;
   int _maxshipmothership = 0;



  PlayerAi(int php, EnumPlayerImages pimage, this.game) : super("BOT", php, pimage)
  {


    var intValue = Random().nextInt(EnumNation.values.length);
    nation = EnumNation.values[intValue];

    if(nation == EnumNation.Rebellen){
      nation = EnumNation.Imperium;
    }
    print("Nation: " + nation.toString());



  }




  void buyphase()
  {
    shopLogic = ShopLogic();
    tempshipshopbuyed =  List.from([game.gameAutoBattle.shopLogic.getRandomShip(2),
      game.gameAutoBattle.shopLogic.getRandomShip(2), game.gameAutoBattle.shopLogic.getRandomShip(2)], growable:  false);
    buy();
  }


  void buy()
  {
     tempshipshopbuyed.forEach((element)
    {
      if(element.nation == nation){
        if(lookifneeded(element)){
          if(currentcredits > element.creditcost)
          {
            currentcredits -=  element.creditcost;
            element.currentteam = 2;
            game.add(element);
            element.rotateImage();
            print("Ai kauft: " + element.toString());
            placeShip(element);
          }
        }


      }

    });
    if(currentcredits >= 11 ){
      reroll();
    }



  }

  void reroll ()
  {
    if(currentcredits >= 10){
      tempshipshopbuyed =  List.from([game.gameAutoBattle.shopLogic
          .getRandomShip(2), game.gameAutoBattle.shopLogic.getRandomShip(2), game.gameAutoBattle.shopLogic.getRandomShip(2)], growable:  false);
      currentcredits--;
      buy();
    }
  }

  void sellShip(BasicShip ship)
  {

  }



  void placeShip(BasicShip ship)

  {

    switch (nation) {

      case EnumNation.Imperium:
        switch (ship.shipclass) {
          case EnumShipClass.Fighter:

            if(game.gameAutoBattle.ennemymap.maincells[0].getNumberOfFreeCells() > 0){
              game.gameAutoBattle.ennemymap.maincells[0].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[2].getNumberOfFreeCells() > 0){
                game.gameAutoBattle.ennemymap.maincells[2].addShip(ship);
              }else{

              }
            }
            break;
          case EnumShipClass.Battleship:
            if(game.gameAutoBattle.ennemymap.maincells[1].getNumberOfFreeCells() > 0){
              game.gameAutoBattle.ennemymap.maincells[1].addShip(ship);
            }

            break;
          case EnumShipClass.Mothership:
            if(game.gameAutoBattle.ennemymap.maincells[3].getNumberOfFreeCells() > 0 ){
              game.gameAutoBattle.ennemymap.maincells[3].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[4].getNumberOfFreeCells() > 0 ){
                game.gameAutoBattle.ennemymap.maincells[4].addShip(ship);
              }else{
                if(game.gameAutoBattle.ennemymap.maincells[5].getNumberOfFreeCells() > 0 ){
                  game.gameAutoBattle.ennemymap.maincells[5].addShip(ship);
                }else{

                }
              }
            }

            break;
        }
        break;

      case EnumNation.Republic:
        switch (ship.shipclass) {
          case EnumShipClass.Fighter:

            if(game.gameAutoBattle.ennemymap.maincells[1].getNumberOfFreeCells() > 0)
            {
              game.gameAutoBattle.ennemymap.maincells[1].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[3].getNumberOfFreeCells() > 0 )
              {
                game.gameAutoBattle.ennemymap.maincells[3].addShip(ship);
              }else{
                if(game.gameAutoBattle.ennemymap.maincells[5].getNumberOfFreeCells() > 0 ){
                  game.gameAutoBattle.ennemymap.maincells[5].addShip(ship);
                }else{
                }
              }
            }
            break;
          case EnumShipClass.Battleship:
            if(game.gameAutoBattle.ennemymap.maincells[0].getNumberOfFreeCells() > 0){
              game.gameAutoBattle.ennemymap.maincells[0].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[2].getNumberOfFreeCells() > 0){
                game.gameAutoBattle.ennemymap.maincells[2].addShip(ship);
              }else{

              }
            }
            break;
          case EnumShipClass.Mothership:

              if(game.gameAutoBattle.ennemymap.maincells[4].getNumberOfFreeCells() > 0 ){
                game.gameAutoBattle.ennemymap.maincells[4].addShip(ship);
              }else{

              }


            break;
        }
        break;
      case EnumNation.CIS:
        switch (ship.shipclass) {
          case EnumShipClass.Fighter:
            if(game.gameAutoBattle.ennemymap.maincells[4].getNumberOfFreeCells() > 0 ){
              game.gameAutoBattle.ennemymap.maincells[4].addShip(ship);
            }else{

            }
            if(game.gameAutoBattle.ennemymap.maincells[1].getNumberOfFreeCells() > 0)
            {
              game.gameAutoBattle.ennemymap.maincells[1].addShip(ship);
            }else{

            }
            break;
          case EnumShipClass.Battleship:
            if(game.gameAutoBattle.ennemymap.maincells[0].getNumberOfFreeCells() > 0){
              game.gameAutoBattle.ennemymap.maincells[0].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[2].getNumberOfFreeCells() > 0){
                game.gameAutoBattle.ennemymap.maincells[2].addShip(ship);
              }else{

              }
            }
            break;
          case EnumShipClass.Mothership:
            if(game.gameAutoBattle.ennemymap.maincells[3].getNumberOfFreeCells() > 0 )
            {
              game.gameAutoBattle.ennemymap.maincells[3].addShip(ship);
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[5].getNumberOfFreeCells() > 0 ){
                game.gameAutoBattle.ennemymap.maincells[5].addShip(ship);
              }else{
              }
            }

            break;
        }
        break;
    }








  }

  bool lookifneeded(BasicShip ship)
  {
    print( _maxshipfighter.toString() + ", " + _maxshipbattleship.toString() + ", " + _maxshipmothership.toString() + ", "+ ship.toString());

    switch (nation)
    {
      case EnumNation.Imperium:

        print(ship.shipclass);
        print("Kaufen Schiff: " + (_maxshipfighter + _maxshipbattleship + _maxshipmothership).toString() + ", to 12");
        if((_maxshipfighter + _maxshipbattleship + _maxshipmothership) <= 12) {
          int counter = 0;
          switch (ship.shipclass)
          {
            case EnumShipClass.Fighter:

              game.gameAutoBattle.player2.team.forEach((element)
              {
                if(element.shipclass ==  EnumShipClass.Fighter){
                  counter++;
                }
              });

              if (counter < 8 ) {
                //_maxshipfighter++;
                return true;
              } else {
                return false;
              }
            case EnumShipClass.Battleship:
              game.gameAutoBattle.player2.team.forEach((element)
              {
                if(element.shipclass ==  EnumShipClass.Battleship){
                  counter++;
                }
              });
              if (counter < 1) {
                _maxshipbattleship++;
                return true;
              } else {
                return false;
              }
            case EnumShipClass.Mothership:
              game.gameAutoBattle.player2.team.forEach((element)
              {
                if(element.shipclass ==  EnumShipClass.Mothership){
                  counter++;
                }
              });
              if (counter < 3) {
                _maxshipmothership++;
                return true;
              } else {
                return false;
              }
          }
        }else{
          return false;
        }
        break;
      case EnumNation.CIS:
        switch (ship.shipclass){
          case EnumShipClass.Fighter:
            if(_maxshipfighter < 10) {
              _maxshipfighter++;
              return true;
            }else {
              return false;
            }
          case EnumShipClass.Battleship:
            if(_maxshipbattleship < 2) {
              _maxshipbattleship++;
              return true;
            }else {
              return false;
            }
          case EnumShipClass.Mothership:
            if(_maxshipmothership < 2) {
              _maxshipmothership++;
              return true;
            }else {
              return false;
            }
        }
        break;
      case EnumNation.Republic:
        switch (ship.shipclass){
          case EnumShipClass.Fighter:
            if(_maxshipfighter < 16) {
              _maxshipfighter++;
              return true;
            }else {
              return false;
            }
          case EnumShipClass.Battleship:
            if(_maxshipbattleship < 2) {
              _maxshipbattleship++;
              return true;
            }else {
              return false;
            }
          case EnumShipClass.Mothership:
            if(_maxshipmothership < 1) {
              _maxshipmothership++;
              return true;
            }else {
              return false;
            }
        }
        break;
    }
    return true;
  }


}