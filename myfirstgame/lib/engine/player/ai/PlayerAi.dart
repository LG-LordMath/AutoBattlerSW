



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
    shopLogic = ShopLogic();
  }




  void buyphase()
  {
    tempshipshopbuyed =  List.from([shopLogic.getRandomShip(), shopLogic.getRandomShip(), shopLogic.getRandomShip()], growable:  false);
    buy();
  }


  void buy()
  {
     tempshipshopbuyed.forEach((element)
    {
      if(element.nation == nation){

      }

    });
    if(currentcredits > 11 ){
      reroll();
    }



  }

  void reroll ()
  {
    if(currentcredits >= 10){
      tempshipshopbuyed =  List.from([shopLogic.getRandomShip(), shopLogic.getRandomShip(), shopLogic.getRandomShip()], growable:  false);
      currentcredits--;
      buy();
    }
  }

  void sellShip(BasicShip ship)
  {

  }


  void placeShip(BasicShip ship)

  {
    if(ship.shipclass == EnumShipClass.Fighter)
    {
      if(game.gameAutoBattle.ennemymap.maincells[0].getNumberOfFreeCells() > 0)
      {

      }else{
        if(game.gameAutoBattle.ennemymap.maincells[1].getNumberOfFreeCells() > 0)
        {

        }else{
          if(game.gameAutoBattle.ennemymap.maincells[2].getNumberOfFreeCells() > 0)
          {

          }else{

          }
        }
      }

    }






  }


}