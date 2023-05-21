



import 'dart:math';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/basic/EnumShipClass.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:myfirstgame/game/backend/commander/EnumGameCommanders.dart';
import '../../nations/EnumNation.dart';
import '../../nations/EnumNation.dart';
import '../../ships/basic/LoaderShips.dart';
import '../../szene/menue/uielements/game/gameshop/ShopLogic.dart';
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



  PlayerAi(int php, EnumGameCommanders commander, this.game) : super("BOT", php, commander)
  {


    var intValue = Random().nextInt(EnumNation.values.length);
    nation = EnumNation.values[intValue];

    if(nation == EnumNation.Rebellen){
      nation = EnumNation.Imperium;
    }
    nation = EnumNation.Imperium;
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
            //print("Ai kauft: " + element.toString());
            placeShip(element);
            checkifshipscanlevelup(game.gameAutoBattle.player2.team);
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
            }
            else
            {
              if(game.gameAutoBattle.ennemymap.maincells[5].getNumberOfFreeCells() > 0 ){
                game.gameAutoBattle.ennemymap.maincells[5].addShip(ship);
              }else
              {
              }
            }

            break;
        }
        break;
    }








  }

  bool lookifneeded(BasicShip ship)
  {
  //  print( _maxshipfighter.toString() + ", " + _maxshipbattleship.toString() + ", " + _maxshipmothership.toString() + ", "+ ship.toString());

    switch (nation)
    {
      case EnumNation.Imperium:

        print(ship.shipclass);
      //  print("Kaufen Schiff: " + (_maxshipfighter + _maxshipbattleship + _maxshipmothership).toString() + ", to 12");
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

  void checkifshipscanlevelup(List<BasicShip> team) {
    List<BasicShip> sameship = [];
    // Iteriere über jedes Schiff im "team" Array
    for (BasicShip ship in team) {
      // Iteriere erneut über jedes Schiff im "team" Array, außer dem aktuell ausgewählten Schiff
      for (BasicShip otherShip in team.where((s) => s != ship)) {
        // Überprüfe, ob die Klasse der Schiffe übereinstimmt
        if (ship.runtimeType == otherShip.runtimeType) {
          // Wenn ja, füge das Schiff zur Liste "sameship" hinzu, falls es noch nicht in der Liste ist
          if (!sameship.contains(ship) ) {
            sameship.add(ship);
          }
          if (!sameship.contains(otherShip)&& ship.level == otherShip.level) {
            sameship.add(otherShip);
          }
        }
      }
    }
    if(sameship.length >= 3)
    {

      List<BasicShip> tempsameship = [];
      sameship.forEach((ship) {
        // List<BasicShip> sameTypeShips = sameship.where((s) => s.runtimeType == ship.runtimeType).toList();

        List<BasicShip> sameTypeShips = sameship
            .where((s) => s.runtimeType == ship.runtimeType && s.runtimeType == ship.runtimeType && s.level == ship.level)
            .toList();
        if (sameTypeShips.length >= 3) {
          tempsameship.addAll(sameTypeShips.sublist(0, 3));
        }
      });
      //  print(tempsameship);
      if(tempsameship.length > 0){

        BasicShip? tempship = LoaderShips.getNewShip(tempsameship[0]);
        if(tempship!=null)
        {
          tempship.level = tempsameship[0].level;
          tempship.level ++;
          tempship.currentteam = 2;
          tempship.cellfields = tempsameship[0].cellfields;
          tempship.mainfieldis = tempsameship[0].mainfieldis;
          for(int i = 0; i < 3; i++)
          {
            team.remove(tempsameship[i]);
            if(tempsameship[i].cellfields.isNotEmpty) {
             game.gameAutoBattle.ennemymap.maincells[tempsameship[i].mainfieldis].releaseCellsAndMap(tempsameship[i].cellfields, tempsameship[i]);
              tempsameship[i].removeFromParent();
            }
          }
          game.gameAutoBattle.add(tempship);
          tempship.scale = Vector2(tempship.shipclass.CellsizeX.toDouble(), tempship.shipclass.CellsizeY.toDouble());
          game.gameAutoBattle.ennemymap.maincells[tempship.mainfieldis].addShip(tempship);

        }


      }


    }
  }

}