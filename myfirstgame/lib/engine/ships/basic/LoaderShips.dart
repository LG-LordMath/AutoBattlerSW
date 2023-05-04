

import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';

import '../../nations/EnumNation.dart';
import '../galacticempireships/EnumGalaticEmpireShips.dart';
import '../galacticempireships/GalacticEmpireShipsLoader.dart';
import '../republicships/EnumRepublicShips.dart';
import '../republicships/RepublicShipsLoader.dart';
import '../seperatistencis/EnumCISShips.dart';
import '../seperatistencis/SeperatistCISShipLoader.dart';

class LoaderShips


{


  static BasicShip? getNewShip(BasicShip ship)

  {

    BasicShip tempship;
    if (ship.nation == EnumNation.Imperium)
    {
      for (int i = 0; i < GalaticEmpireShipsLoader.empireships.length; i++)
      {
        if (GalaticEmpireShipsLoader.empireships.values.elementAt(i).runtimeType == ship.runtimeType)
        {
          GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
          rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));
          tempship =GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(i)]!;
          tempship.currentteam = 1;
          tempship.level = ship.level;
          tempship.rotateImage();
          tempship.mainfieldis = ship.mainfieldis;
          rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));
          return tempship;
        }
      }
    }
    else if (ship.nation == EnumNation.Republic) {
      for (int i = 0; i < RepublicShipsLoader.republicships .length; i++)
      {
        if (RepublicShipsLoader.republicships.values.elementAt(i).runtimeType == ship.runtimeType)
        {
          RepublicShipsLoader rep = RepublicShipsLoader();
          rep.reloadObject(EnumRepublicShips.values.elementAt(i));
          tempship =RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(i)]!;
          tempship.currentteam = 1;
          tempship.level = ship.level;
          tempship.rotateImage();
          tempship.mainfieldis = ship.mainfieldis;

          rep.reloadObject(EnumRepublicShips.values.elementAt(i));
          return tempship;
        }
      }
    }
    else if (ship.nation == EnumNation.CIS) {

      for (int i = 0; i < SeperatistCISShipLoader.cisships.length; i++)
      {
        if (SeperatistCISShipLoader.cisships.values.elementAt(i).runtimeType == ship.runtimeType)
        {
          SeperatistCISShipLoader rep = SeperatistCISShipLoader();
          rep.reloadObject(EnumCISShips.values.elementAt(i));
          tempship =SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(i)]!;
          tempship.currentteam = 1;
          tempship.level = ship.level;
          tempship.rotateImage();
          tempship.mainfieldis = ship.mainfieldis;
          rep.reloadObject(EnumCISShips.values.elementAt(i));
          return tempship;
        }
      }
    }
    return null;
  }

}