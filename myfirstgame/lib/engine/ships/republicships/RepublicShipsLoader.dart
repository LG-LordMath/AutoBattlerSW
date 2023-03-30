import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';

import 'ARC170.dart';

class RepublicShipsLoader{


  static Map<EnumRepublicShips, BasicShip> republicships  = {};

  @override
  Future<void> load() async {

    republicships[EnumRepublicShips.ARC170] = ARC170(0, 0, 40, 50, 1);
 //   republicships[EnumNation.Imperium] = BasicNation("Galactic Empire", ImageLoader.sprites[EnumImages.IconImperium]!, "The Galactic Empire, also known as the First Galactic Empire, the Empire and later as the Old Empire, was the monarchy that replaced the Galactic Republic at the end of the Clone Wars. Though the Empire rose to power by promising to bring order to the galaxy, it oversaw a period of harsh military rule and aggressive expansion.");

  }

}