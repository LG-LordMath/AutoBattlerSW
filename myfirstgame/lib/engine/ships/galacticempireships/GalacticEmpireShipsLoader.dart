


import 'package:myfirstgame/engine/ships/galacticempireships/AcclamatorEmpire.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/ArquitensEmpire.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/DeltaClass.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/ImperialClass.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/TieBomber.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/TieIntercepter.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/Victory.dart';

import '../BasicShip.dart';
import 'EnumGalaticEmpireShips.dart';
import 'Tie.dart';

class GalaticEmpireShipsLoader{


  static Map<EnumGalaticEmpireShips, BasicShip> empireships  = {};

  void load()  {
    empireships[EnumGalaticEmpireShips.Tie] = Tie(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.TieBomber] = TieBomber(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.TieIntercepter] = TieIntercepter(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.DeltaClass] = DeltaClass(0, 0, 40, 50, 1);

    empireships[EnumGalaticEmpireShips.Arquitens] = ArquitensEmpire(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.Acclamator] = AcclamatorEmpire(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.ImperialClass] = ImperialClass(0, 0, 40, 50, 1);
    empireships[EnumGalaticEmpireShips.Victory] = Victory(0, 0, 40, 50, 1);
  }

  void reloadObject(EnumGalaticEmpireShips ship)
  {
    switch (ship){

      case EnumGalaticEmpireShips.Tie:
        empireships[EnumGalaticEmpireShips.Tie] = Tie(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.TieBomber:
        empireships[EnumGalaticEmpireShips.TieBomber] = TieBomber(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.TieIntercepter:
        empireships[EnumGalaticEmpireShips.TieIntercepter] = TieIntercepter(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.DeltaClass:
        empireships[EnumGalaticEmpireShips.DeltaClass] = DeltaClass(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.Arquitens:
        empireships[EnumGalaticEmpireShips.Arquitens] = ArquitensEmpire(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.Acclamator:
        empireships[EnumGalaticEmpireShips.Acclamator] = AcclamatorEmpire(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.ImperialClass:
        empireships[EnumGalaticEmpireShips.ImperialClass] = ImperialClass(0, 0, 40, 50, 1);
        break;
      case EnumGalaticEmpireShips.Victory:
        empireships[EnumGalaticEmpireShips.Victory] = Victory(0, 0, 40, 50, 1);
        break;

    }
  }



}