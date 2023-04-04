


import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';

import '../BasicShip.dart';

class RepublicShipsLoader
{
  static Map<EnumCISShips, BasicShip> cisships  = {};

  void load()  {
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

  void reloadObject(EnumRepublicShips ship)
  {
    switch (ship){
      case EnumRepublicShips.Acclamator:
        republicships[EnumRepublicShips.Acclamator] = Acclamator(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.ARC170:
        republicships[EnumRepublicShips.ARC170] = ARC170(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.Arquitens:
        republicships[EnumRepublicShips.Arquitens] = Arquitens(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.CR90Corvette:
        republicships[EnumRepublicShips.CR90Corvette] = CR90Corvette(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.ETA2Actis:
        republicships[EnumRepublicShips.ETA2Actis] = ETA2Actis(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.NuAttackShuttle:
        republicships[EnumRepublicShips.NuAttackShuttle] = NuAttackShuttle(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.Venator:
        republicships[EnumRepublicShips.Venator] = Venator(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.YWing:
        republicships[EnumRepublicShips.YWing] = YWing(0, 0, 40, 50, 1);
        break;
      case EnumRepublicShips.Z95:
        republicships[EnumRepublicShips.Z95] = Z95(0, 0, 40, 50, 1);
        break;
    }
  }
