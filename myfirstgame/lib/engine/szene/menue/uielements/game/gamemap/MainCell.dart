

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../ships/BasicShip.dart';
import '../../../../../ships/EnumShipClass.dart';
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
  Map<BasicShip, List<int>> shipPositions = Map();
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

    /*


    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;

     */
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

    if (numOfCellsHorizontal >= cellSizeX && numOfCellsVertical >= cellSizeY) {
      int firstCell = -1;
      for (int i = 0; i < cells.length; i++) {
        if (!cells[i].isOccupied) {
          bool hasEnoughFreeCells = true;
          if (cellSizeX == 2 && i % numOfCellsHorizontal == numOfCellsHorizontal - 1) {
            // For ships with size 2 in X direction, check if the current cell is the last cell in a row
            hasEnoughFreeCells = false;
          } else {
            for (int y = i; y < i + cellSizeX * cellSizeY; y++) {
              if (y >= cells.length || cells[y].isOccupied) {
                hasEnoughFreeCells = false;
                break;
              }
            }
          }

          if (hasEnoughFreeCells) {
            firstCell = i;
            break;
          }
        }
      }

      if (firstCell != -1) {
        cells[firstCell].isOccupied = true;
        ship.cellfields.add(firstCell);
        for (int y = firstCell + 1; y < firstCell + cellSizeX * cellSizeY; y++) {
          cells[y].isOccupied = true;
          ship.cellfields.add(y);
        }

        shipPositions[ship] = ship.cellfields;
        cells[firstCell].setShipPosition(ship);
        if(ship.currentteam == 1){
          gameRef.gameAutoBattle.player1.team.add(ship);
        }else {
          gameRef.gameAutoBattle.player2.team.add(ship);
        }
      } else {
        // print("Keine ausreichend großen freien Zellen gefunden");
        // Handle, wenn nicht genügend freie Zellen vorhanden sind
          gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
          ship.scale = Vector2(1, 1);
      }
    } else {
      // print("Ungültige Schiffgröße");
      // Handle, wenn die Schiffgröße ungültig ist
      if (gameRef.gameAutoBattle.bottomBar.isFull()) {
        // Check if bottomBar is full
        gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
      } else {
        // Add ship back to bottomBar if it's not full
        gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
        ship.scale = Vector2(1, 1);
      }
    }
  }

  void releaseCellsAndMap(List<int> cellfields, BasicShip ship) {
    if (cellfields.isNotEmpty) {
      print(cellfields.isNotEmpty);

      for (int cellIndex in cellfields) {
        if (cellIndex >= 0 && cellIndex < cells.length) {
          print(cellIndex.toString() + ", "+cells[cellIndex].isOccupied.toString());
          cells[cellIndex].deoccupyCell();
          print(cellIndex.toString() + ", "+cells[cellIndex].isOccupied.toString());
        }
      }
    }
    shipPositions.keys.forEach((ship) => print(ship.toString()));
    shipPositions.removeWhere((key, value) => key == ship);
    shipPositions.keys.forEach((ship) => print(ship.toString()));
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


  List<Cell> getFreeCells()
  {
    return cells.where((cell) => !cell.isOccupied).toList();
  }

  int getNumberOfFreeCells() {
    List<Cell> freeCells = cells.where((cell) => !cell.isOccupied).toList();
    return freeCells.length;
  }

  List<Cell> getOccupiedCells() {
    return cells.where((cell) => cell.isOccupied).toList();
  }


}
