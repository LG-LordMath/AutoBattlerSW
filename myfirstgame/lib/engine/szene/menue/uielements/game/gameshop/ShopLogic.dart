


import 'dart:math';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/republicships/Acclamator.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../nations/EnumNation.dart';
import '../../../../../player/ai/PlayerAi.dart';
import '../../../../../ships/galacticempireships/EnumGalaticEmpireShips.dart';
import '../../../../../ships/galacticempireships/GalacticEmpireShipsLoader.dart';
import '../../../../../ships/republicships/EnumRepublicShips.dart';
import '../../../../../ships/republicships/RepublicShipsLoader.dart';
import '../../../../../ships/seperatistencis/EnumCISShips.dart';
import '../../../../../ships/seperatistencis/SeperatistCISShipLoader.dart';


class ShopLogic extends Component with HasGameRef<MySpaceGame>




{


   BasicShip getRandomShip(int player)


  {

    int republic = 25;
    int imperium = 25;
    int rebell = 25;
    int cis = 25;
    if(player == 1){
      gameRef.gameAutoBattle.player1.team.forEach((element) {

        switch (element.nation) {
          case EnumNation.Republic:
            if(republic<=74){
              republic += 15;
              imperium -= 5;
              rebell -= 5;
              cis -= 5;
            }
            break;
          case EnumNation.Imperium:
            if(imperium<=74) {
              imperium += 15;
              republic -= 5;
              rebell -= 5;
              cis -= 5;
            }
            break;
          case EnumNation.Rebellen:
            if(rebell<=74) {
              rebell += 15;
              imperium -= 5;
              republic -= 5;
              cis -= 5;
            }
            break;
          case EnumNation.CIS:
            if(cis<=74) {
              cis += 15;
              imperium -= 5;
              rebell -= 5;
              republic -= 5;
            }
            break;
        }

      });
    }else {
      PlayerAi   player;
      if(gameRef.gameAutoBattle.player2 is PlayerAi)
      {
           player =  gameRef.gameAutoBattle.player2 as PlayerAi;
           switch(player.nation) {
             case EnumNation.Republic:
               republic += 30;
               imperium -= 10;
               rebell -= 10;
               cis -= 10;
               break;
             case EnumNation.Imperium:
                 imperium += 30;
                 republic -= 10;
                 rebell -= 10;
                 cis -= 10;
               break;
             case EnumNation.Rebellen:
                 rebell += 30;
                 imperium -= 10;
                 republic -= 10;
                 cis -= 10;

               break;
             case EnumNation.CIS:
                 cis += 30;
                 imperium -= 10;
                 rebell -= 10;
                 republic -= 10;

               break;
           }

      }



    }

    var random = Random();
    var randomNumber = random.nextInt(100);
    var randomNumberShip;
    BasicShip tempbasicShip;


    if (randomNumber < republic) {

      randomNumberShip = random.nextInt(RepublicShipsLoader.republicships.length );
      tempbasicShip =  RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(randomNumberShip)]!;
      RepublicShipsLoader rep = RepublicShipsLoader();
      rep.reloadObject(EnumRepublicShips.values.elementAt(randomNumberShip));
     // print("Republic hat gewonnen! "+tempbasicShip.toString());
      return tempbasicShip;

    } else if (randomNumber < republic + imperium) {

      randomNumberShip = random.nextInt(GalaticEmpireShipsLoader.empireships.length );
      tempbasicShip =  GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(randomNumberShip)]!;
      GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
      rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(randomNumberShip));
  //    print("Imperium hat gewonnen! "+ tempbasicShip.toString());
      return tempbasicShip;

    } else if (randomNumber < republic + imperium + rebell) {
     print("Rebell hat gewonnen! ");
      tempbasicShip = Acclamator(0, 0, 50, 50, 0);
    } else {

      randomNumberShip = random.nextInt(SeperatistCISShipLoader.cisships.length );
      tempbasicShip =  SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(randomNumberShip)]!;
      SeperatistCISShipLoader cisShipLoader = SeperatistCISShipLoader();
      cisShipLoader.reloadObject(EnumCISShips.values.elementAt(randomNumberShip));
   //   print("CIS hat gewonnen! "+ tempbasicShip.toString());
      return tempbasicShip;
    }
    return tempbasicShip;
  }

}