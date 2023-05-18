import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/szene/menue/enums/EnumGameState.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'MainCell.dart';


class GamePlayFieldMap extends SpriteComponent with HasGameRef<MySpaceGame>

{
  late double positionX;
  late double positionY;
  late List<MainCell> maincells = [];
  late SpriteComponent componentSprite;

  final _defaultColor = Colors.red;
  late ShapeHitbox hitbox;

  Effect viseffect = OpacityEffect.to(
    0.1,
    EffectController(duration: 1),
  );
  GamePlayFieldMap(this.positionX, this.positionY);




  @override
  Future<void> onLoad() async
  {
    /*
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke ;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);

     */

    sprite = ImageLoader.sprites[EnumImages.UIGameFieldOne];
    parent = gameRef;
    position = Vector2(positionX, positionY);
    size = Vector2(gameRef.size[0] / 1.2,  gameRef.size[1]/ 3.0);
    Sprite? image = ImageLoader.sprites[EnumImages.UIGameFieldOne];
    componentSprite = SpriteComponent(sprite: image, size: size, position: Vector2(0,0));
    final effect = GlowEffect(
      100.0,
      EffectController(duration: 2),
    );
    add(effect);
    add(componentSprite);
    print("Gamemapsize: X "+size.x.toString() + ", Y "+size.y.toString());
    MainCell main1_1 = MainCell(size.x / 3.19 , size.y / 2.6, 2, 2, Vector2(size.x / 68,size.y / 57));
    MainCell main2_1 = MainCell(size.x / 3.19 , size.y / 2.6, 2, 2, Vector2(size.x / 5.6, size.y / 57));
    MainCell main3_1 = MainCell(size.x / 3.19 , size.y / 2.6, 2, 2, Vector2(size.x / 2.91, size.y / 57));

    MainCell main1_2 = MainCell(size.x / 3.19 , size.y / 1.75, 2, 3, Vector2(size.x / 68,size.y / 4.6));
    MainCell main2_2 = MainCell(size.x / 3.19 , size.y / 1.75, 2, 3, Vector2(size.x / 5.6,size.y / 4.6));
    MainCell main3_2 = MainCell(size.x / 3.19 , size.y / 1.75, 2, 3, Vector2(size.x / 2.91,size.y / 4.6));
    //SpriteComponent sp = SpriteComponent(
    //sprite: ImageLoader.sprites[EnumImages.UICardOne], size: Vector2(200, 200), position: Vector2(0,0));
   // add(sp);
    maincells.add(main1_1);
    maincells.add(main2_1);
    maincells.add(main3_1);
    maincells.add(main1_2);
    maincells.add(main2_2);
    maincells.add(main3_2);
    add(main1_1);
    add(main2_1);
    add(main3_1);
    add(main1_2);
    add(main2_2);
    add(main3_2);

  }

  void addShip(BasicShip ship) {
    print(gameRef.gameAutoBattle.gameState);
    if(gameRef.gameAutoBattle.gameState == EnumGameState.BUYPHASE){
      double minDistance = double.infinity; // Start mit einer sehr großen Distanz
      MainCell? mainCell;
      int cellposition = 0;
      for (int i = 0; i < maincells.length; i++) {
        Vector2 position1 = maincells[i].absolutePosition;
        Vector2 position2 = Vector2(maincells[i].absolutePosition.x + maincells[i].width, maincells[i].absolutePosition.y + maincells[i].height);
        Vector2 center =(position2 + position1)  / 2;
        double distance = (ship.absolutePosition - center).length; // Verwendung von hypot für Distanzberechnung
        if (distance < minDistance) {
          minDistance = distance; // Aktualisiere den minimalen Abstand
          mainCell = maincells[i];
          cellposition = i;
          // print("Minimale Entfernung: $minDistance");
        }
      }
      if (mainCell != null) { // Überprüfung auf null für mainCell
        ship.mainfieldis = cellposition;
        mainCell?.addShip(ship);
      }

      }else{
      ship.scale = Vector2(1, 1);
      gameRef.gameAutoBattle.bottomBar.addShipToBar(ship);
    }

  }

  void setVisibale(bool vis)
  {
    Effect vieffect;
    if(!vis)
    {
      vieffect = OpacityEffect.to(
        0,
        EffectController(duration: 2),
      );
      componentSprite.add(vieffect);
      vieffect.removeOnFinish;
    }
    else
    {
      vieffect = OpacityEffect.to(
          1,
          EffectController(duration: 0),);
      componentSprite.add(vieffect);
      vieffect.removeOnFinish;
    }
  }
}