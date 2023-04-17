



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/EnumShipClass.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
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

  PlayerAi(int php, EnumPlayerImages pimage, this.game) : super('BOT', php, pimage)
  {

    /*
    var intValue = Random().nextInt(EnumNation.values.length);
    nation = EnumNation.values[intValue];

     */
    nation = EnumNation.Imperium;

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
            placeShip(element);
            game.gameAutoBattle.add(element);
            element.rotateImage();
            element.position =Vector2(50, 300);
          }
        }


      }

    });
    if(currentcredits > 11 ){
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
    /*
    switch (nation) {

      case EnumNation.Imperium:
        switch (ship.shipclass) {
          case EnumShipClass.Fighter:
            if (game.gameAutoBattle.ennemymap.maincells[1]
                .getNumberOfFreeCells() >=
                (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
              game.gameAutoBattle.ennemymap.maincells[1].addShip(ship);
            } else {
              if (game.gameAutoBattle.ennemymap.maincells[2]
                  .getNumberOfFreeCells() >=
                  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
                game.gameAutoBattle.ennemymap.maincells[2].addShip(ship);
              } else {
              }
            }
            break;
          case EnumShipClass.Battleship:
            if (game.gameAutoBattle.ennemymap.maincells[0]
                .getNumberOfFreeCells() >=
                (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
              game.gameAutoBattle.ennemymap.maincells[0].addShip(ship);
            } else {
            }
            break;
          case EnumShipClass.Mothership:
            if (game.gameAutoBattle.ennemymap.maincells[3]
                .getNumberOfFreeCells() >=
                (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
              game.gameAutoBattle.ennemymap.maincells[3].addShip(ship);
            } else {
              if (game.gameAutoBattle.ennemymap.maincells[4]
                  .getNumberOfFreeCells() >=
                  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
                game.gameAutoBattle.ennemymap.maincells[4].addShip(ship);
              } else {
                if (game.gameAutoBattle.ennemymap.maincells[5]
                    .getNumberOfFreeCells() >=
                    (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)) {
                  game.gameAutoBattle.ennemymap.maincells[5].addShip(ship);
                } else {
                }
              }
            }
        }
        break;
    }

     */






  }

  bool lookifneeded(BasicShip ship)
  {
    switch (nation)
    {
      case EnumNation.Imperium:
        switch (ship.shipclass){
          case EnumShipClass.Fighter:

              if(game.gameAutoBattle.ennemymap.maincells[1].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
                return true;
              }else{
                if(game.gameAutoBattle.ennemymap.maincells[2].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
                  return true;
                }else{
                  return false;
                }
              }
            break;
          case EnumShipClass.Battleship:
            if(game.gameAutoBattle.ennemymap.maincells[0].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
              return true;
            }else {
              return false;
            }
            break;
          case EnumShipClass.Mothership:
            if(game.gameAutoBattle.ennemymap.maincells[3].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
              return true;
            }else{
              if(game.gameAutoBattle.ennemymap.maincells[4].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
                return true;
              }else{
                if(game.gameAutoBattle.ennemymap.maincells[5].getNumberOfFreeCells() >=  (ship.shipclass.CellsizeX * ship.shipclass.CellsizeY)){
                  return true;
                }else{
                  return false;
                }
              }
            }
        }


        break;
      case EnumNation.CIS:
        break;
      case EnumNation.Republic:
        break;
    }



    return true;
  }


}