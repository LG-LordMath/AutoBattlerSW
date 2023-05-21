


enum EnumShipClass

{
  Fighter(nameofshipclass: "Fighter", CellsizeX: 1, CellsizeY: 1, Iconpath: "ships/normal/FighterIcon.png"),
  Figatte(nameofshipclass: "Figatte", CellsizeX: 1, CellsizeY: 2,  Iconpath: "ships/normal/FrigateIcon.png"),
  Battleship(nameofshipclass: "Battleship", CellsizeX: 2, CellsizeY: 2,  Iconpath: "ships/normal/BattleShipIcon.png"),
  Mothership(nameofshipclass: "Mothership", CellsizeX: 2, CellsizeY: 3,  Iconpath: "ships/normal/MotherShipIcon.png"),
  Titan(nameofshipclass: "Titan", CellsizeX: 2, CellsizeY: 3, Iconpath: "ships/normal/TitanIcon.png"),
  ;
  const EnumShipClass({
    required this.nameofshipclass,
    required this.CellsizeX,
    required this.CellsizeY,
    required this.Iconpath,
  });

  final String nameofshipclass;
  final int CellsizeX;
  final int CellsizeY;
  final String Iconpath;

}