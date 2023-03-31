import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/republicships/Acclamator.dart';
import 'package:myfirstgame/engine/ships/republicships/Arquitens.dart';
import 'package:myfirstgame/engine/ships/republicships/CR90Corvette.dart';
import 'package:myfirstgame/engine/ships/republicships/ETA2Actis.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/ships/republicships/NuAttackShuttle.dart';
import 'package:myfirstgame/engine/ships/republicships/Venator.dart';
import 'package:myfirstgame/engine/ships/republicships/YWing.dart';
import 'package:myfirstgame/engine/ships/republicships/Z95.dart';

import 'ARC170.dart';

class RepublicShipsLoader{


  static Map<EnumRepublicShips, BasicShip> republicships  = {};

  @override
  Future<void> load() async {
    republicships[EnumRepublicShips.Acclamator] = Acclamator(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.ARC170] = ARC170(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.Arquitens] = Arquitens(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.CR90Corvette] = CR90Corvette(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.ETA2Actis] = ETA2Actis(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.NuAttackShuttle] = NuAttackShuttle(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.Venator] = Venator(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.YWing] = YWing(0, 0, 40, 50, 1);
    republicships[EnumRepublicShips.Z95] = Z95(0, 0, 40, 50, 1);


 //   republicships[EnumNation.Imperium] = BasicNation("Galactic Empire", ImageLoader.sprites[EnumImages.IconImperium]!, "The Galactic Empire, also known as the First Galactic Empire, the Empire and later as the Old Empire, was the monarchy that replaced the Galactic Republic at the end of the Clone Wars. Though the Empire rose to power by promising to bring order to the galaxy, it oversaw a period of harsh military rule and aggressive expansion.");

  }

}