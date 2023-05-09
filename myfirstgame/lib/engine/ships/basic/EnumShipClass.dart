


enum EnumShipClass

{
  Fighter(nameofshipclass: "Fighter", CellsizeX: 1, CellsizeY: 1),
  Figatte(nameofshipclass: "Figatte", CellsizeX: 1, CellsizeY: 2),
  Battleship(nameofshipclass: "Battleship", CellsizeX: 2, CellsizeY: 2),
  Mothership(nameofshipclass: "Mothership", CellsizeX: 2, CellsizeY: 3),
  Titan(nameofshipclass: "Titan", CellsizeX: 2, CellsizeY: 3),
  ;
  const EnumShipClass({
    required this.nameofshipclass,
    required this.CellsizeX,
    required this.CellsizeY,
  });

  final String nameofshipclass;
  final int CellsizeX;
  final int CellsizeY;
}