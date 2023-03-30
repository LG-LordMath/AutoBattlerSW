



import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/nations/BasicNation.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';

class NationLoader{


  static Map<EnumNation, BasicNation> nations  = {};

  @override
  Future<void> load() async {
    nations[EnumNation.CIS] = BasicNation("Confederacy of Independent Systems", ImageLoader.sprites[EnumImages.IconSeperatisten]!, "The Confederacy of Independent Systems, abbreviated to CIS, and otherwise known as the Separatist Alliance, the Separatist State, the Separatist Confederacy, or simply referred to as the Separatists, was a united galaxy-wide confederacy formed of star systems that had withdrawn their membership from the Galactic Republic, a democratic union, whom the Confederacy had opposed following a period of political turmoil.");
    nations[EnumNation.Imperium] = BasicNation("Galactic Empire", ImageLoader.sprites[EnumImages.IconImperium]!, "The Galactic Empire, also known as the First Galactic Empire, the Empire and later as the Old Empire, was the monarchy that replaced the Galactic Republic at the end of the Clone Wars. Though the Empire rose to power by promising to bring order to the galaxy, it oversaw a period of harsh military rule and aggressive expansion.");
    nations[EnumNation.Rebellen] = BasicNation("Rebel Alliance", ImageLoader.sprites[EnumImages.IconRebellen]!, "The Alliance to Restore the Republic (2 BBY–4 ABY), commonly known as the Rebel Alliance, Alliance, and the Rebellion, was a resistance movement formed by Senator Mon Mothma to oppose the reign of the Galactic Empire. The Alliance was publicly and formally declared with the Declaration of the Rebel Alliance, which brought numerous rebel cells together as a common force opposed to the Empire.");
    nations[EnumNation.Republic] = BasicNation("Galactic Republic", ImageLoader.sprites[EnumImages.IconRepublic]!, "The Galactic Republic, also known as the Grand Republic or simply as the Republic, was a democratic federal union spread across light-years of space. Old Republic and first Galactic Republic were terms affixed to the pre-modern Republic that existed until 1032 BBY, with the Old Republic also referring to the modern Republic that was supplanted by the Galactic Empire in 19 BBY. In addition, the term High Republic denoted the era in which the Republic reached the zenith of its power, lasting from around 500 BBY to around 82 BBY. ");


  }

}