


import 'package:myfirstgame/engine/ships/seperatistencis/C9979.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Hyaenen.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Lucrehulk.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Munificent.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Providenz.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Recusant.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SRPDroid.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Subjugator.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Valture.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/Zenuas33.dart';
import '../BasicShip.dart';

class SeperatistCISShipLoader {

  static Map<EnumCISShips, BasicShip> cisships = {};

  void load() {
    cisships[EnumCISShips.Valture] = Valture(0, 0, 40, 50, 1);
    cisships[EnumCISShips.C9979] = C9979(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Hyaenen] = Hyaenen(0, 0, 40, 50, 1);
    cisships[EnumCISShips.SRPDroid] = SRPDroid(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Zenuas33] = Zenuas33(0, 0, 40, 50, 1);

    cisships[EnumCISShips.Lucrehulk] = Lucrehulk(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Munificent] = Munificent(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Providenz] = Providenz(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Recusant] = Recusant(0, 0, 40, 50, 1);
    cisships[EnumCISShips.Subjugator] = Subjugator(0, 0, 40, 50, 1);
  }

  void reloadObject(EnumCISShips ship) {


    switch (ship){
      case EnumCISShips.Valture:
        cisships[EnumCISShips.Valture] = Valture(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.C9979:
        cisships[EnumCISShips.C9979] = C9979(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Hyaenen:
        cisships[EnumCISShips.Hyaenen] = Hyaenen(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.SRPDroid:
        cisships[EnumCISShips.SRPDroid] = SRPDroid(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Zenuas33:
        cisships[EnumCISShips.Zenuas33] = Zenuas33(0, 0, 40, 50, 1);
        break;

      case EnumCISShips.Lucrehulk:
        cisships[EnumCISShips.Lucrehulk] = Lucrehulk(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Munificent:
        cisships[EnumCISShips.Munificent] = Munificent(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Providenz:
        cisships[EnumCISShips.Providenz] = Providenz(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Recusant:
        cisships[EnumCISShips.Recusant] = Recusant(0, 0, 40, 50, 1);
        break;
      case EnumCISShips.Subjugator:
        cisships[EnumCISShips.Subjugator] = Subjugator(0, 0, 40, 50, 1);
        break;
    }
  }
}
