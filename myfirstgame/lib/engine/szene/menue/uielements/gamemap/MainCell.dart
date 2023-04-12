

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../ships/BasicShip.dart';
import '../../../../ships/EnumShipClass.dart';
import 'Cell.dart';

class MainCell  extends PositionComponent with CollisionCallbacks, HasGameRef<MySpaceGame>{
  late int numOfCellsHorizontal;
  late int numOfCellsVertical;
  late double cellSize;
  late int idcell;

  late Vector2 pposition;
  final _defaultColor = Colors.red;
  late ShapeHitbox hitbox;
  late List<Cell> cells = [];
  late Vector2 sizeofCell;

  late double height;
  late double width;

  MainCell(this.width, this.height, this.numOfCellsHorizontal, this.numOfCellsVertical, this.pposition);



  @override
  Future<void> onLoad() async
  {
    this.position = pposition;

    sizeofCell = Vector2(width / numOfCellsHorizontal, height / numOfCellsVertical);

    //cellSize = max(width / numOfCellsHorizontal, height / numOfCellsHorizontal);
    numOfCellsHorizontal = (width / sizeofCell.x).ceil();
    numOfCellsVertical = (height / sizeofCell.y).ceil();
    size = Vector2(width, height);

    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
  // add(hitbox);
    _createCells();
  }



  void _createCells() {
    int tempanzahl = 0;
    for (int i = 0; i < numOfCellsVertical; i++) {
      for (int j = 0; j < numOfCellsHorizontal; j++) {
        Cell tempcell =  Cell(false, Vector2(sizeofCell.x, sizeofCell.y), Vector2(position.x + j * sizeofCell.x - 5, position.y + i * sizeofCell.y - 5));
       //Cell tempcell =  Cell(false, Vector2(cellSize, cellSize), Vector2(position.x + j * cellSize, position.y + i * cellSize));
       cells.add(tempcell);
       add(tempcell);
       tempanzahl++;
      }
    }
    print("anzahl an Cells: "+ tempanzahl.toString());
  }

  void addShip(BasicShip ship) {
    int cellSizeX = EnumShipClass.values[ship.shipclass.index].CellsizeX;
    int cellSizeY = EnumShipClass.values[ship.shipclass.index].CellsizeY;
    print(cellSizeX.toString() + ", " + cellSizeY.toString());
    if(numOfCellsHorizontal >= cellSizeX && numOfCellsVertical >= cellSizeY){
      print("vorhanden");
      int tempcountercellfree = 0;
      int firstcell = 0;
      for(int i = 0; i<cells.length;i++){
        if(cells[i].isOccupied)
        {
          tempcountercellfree = 0;
          firstcell = i+ 1;
        }else{
          tempcountercellfree++;
        }
      }
      print(tempcountercellfree.toString() + ", benötigt: " +  (cellSizeX * cellSizeY).toString());
      print(firstcell.toString());

      if(tempcountercellfree >= (cellSizeX * cellSizeY))
        {
          print("Modulo: "+ (cellSizeX % firstcell).toString());
          if(cellSizeX % firstcell !=0){

          }

          cells[firstcell].isOccupied = true;
          ship.cellfields.add(firstcell);
          for(int y = firstcell; y < cellSizeX * cellSizeY;y++){
            cells[y].isOccupied = true;
            print("cell: "+ y.toString());
            ship.cellfields.add(y);
          }
          cells[firstcell].setShipPosition(ship);


        }
        else
        {
          print("gebe es auf die letzte position zurück / Shop, wegen zuwenig frei");
          gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
          ship.scale=Vector2(1, 1);
        }


    }else{
      print("gebe es auf die letzte position zurück / Shop, ergen größe");
      gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
      ship.scale=Vector2(1, 1);

    }

    /*
    bool hasShip = false;
    for (int i = 0; i < cellSizeY; i++) {
      for (int j = 0; j < cellSizeX; j++) {
        int index = ((ship.position.y.toInt() + i) * numOfCellsHorizontal) + ship.position.x.toInt() + j;

        if (index >= 0 && index < cells.length && !cells[index].isOccupied) {
          cells[index].occupyCell();
          print("Celle: "+index.toString()+" wurde besetzt");
          if (!hasShip) {

            cells[index].setShipPosition(ship);
            hasShip = true;
          }
        } else {
          // handle cell out of range or already occupied
          return;
        }
      }
    }

     */
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is BasicShip)
    {

    }
  }


  List<Cell> getFreeCells() {
    return cells.where((cell) => !cell.isOccupied).toList();
  }

  List<Cell> getOccupiedCells() {
    return cells.where((cell) => cell.isOccupied).toList();
  }


}
