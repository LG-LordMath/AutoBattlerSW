


import 'package:myfirstgame/engine/nations/EnumNation.dart';

enum EnumGameCommanders
{

  CommanderOne(nameofCommander: "Trench", life: 8, baseofIncomeperRound: 9, Iconpath: "player/icon/Admiral1Full.png", IconSmallpath: "player/icon/Admiral1.png", nation: EnumNation.CIS),
  CommanderTwo(nameofCommander: "Captain Zank", life: 6, baseofIncomeperRound: 11, Iconpath: "player/icon/Admiral2Full.png", IconSmallpath: "player/icon/Admiral2.png",nation: EnumNation.Republic),
  CommanderThree(nameofCommander: "Alexsandr Kallus", life: 7, baseofIncomeperRound: 10, Iconpath: "player/icon/Admiral3Full.png", IconSmallpath: "player/icon/Admiral3.png",nation: EnumNation.Imperium),
  CommanderFour(nameofCommander: "Grand Admiral Thrawn", life: 5, baseofIncomeperRound: 12, Iconpath: "player/icon/Admiral4Full.png", IconSmallpath: "player/icon/Admiral4.png",nation: EnumNation.Imperium),
  CommandressOne(nameofCommander: "Captain Kaisara"
    //  "Liveveart"
      , life: 6, baseofIncomeperRound: 11, Iconpath: "player/icon/Admiralin1Full.png", IconSmallpath: "player/icon/Admiralin1.png",nation: EnumNation.Imperium),
  CommandressTwo(nameofCommander: "Proxy Fantsy", life: 8, baseofIncomeperRound: 9, Iconpath: "player/icon/Admiralin2Full.png", IconSmallpath: "player/icon/Admiralin2.png",nation: EnumNation.CIS)
  ;



  const EnumGameCommanders({
    required this.nameofCommander,
    required this.life,
    required this.baseofIncomeperRound,
    required this.Iconpath,
    required this.IconSmallpath,
    required this.nation,
  });

  final String nameofCommander;
  final int life;
  final int baseofIncomeperRound;
  final String Iconpath;
  final String IconSmallpath;
  final EnumNation nation;


}