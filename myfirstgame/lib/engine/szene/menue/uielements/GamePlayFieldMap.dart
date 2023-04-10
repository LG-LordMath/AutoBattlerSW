





import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/BasicShip.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../ships/EnumShipClass.dart';
import 'GameMap/Cell.dart';
import 'GameMap/MainCell.dart';

class GamePlayFieldMap extends SpriteComponent with HasGameRef<MySpaceGame>

{
  late double positionX;
  late double positionY;
  late List<MainCell> maincells = [];

  GamePlayFieldMap(this.positionX, this.positionY);




  @override
  Future<void> onLoad() async
  {

    sprite = ImageLoader.sprites[EnumImages.UIGameFieldOne];
    parent = gameRef;
    position = Vector2(positionX, positionY);
    size = Vector2(gameRef.size[0] / 1.2,  gameRef.size[1]/ 3.0);
    Sprite? image = ImageLoader.sprites[EnumImages.UIGameFieldOne];
    SpriteComponent componentSprite = SpriteComponent(sprite: image, size: size, position: Vector2(0,0));
  final effect = GlowEffect(
      100.0,
      EffectController(duration: 2),
    );
    //add(effect);
   // add(componentSprite);

    MainCell main1_1 = MainCell(107 , 91, 2, 2, Vector2(5,5));
    MainCell main2_1 = MainCell(107 , 91, 2, 2, Vector2(61.5,5));
    MainCell main3_1 = MainCell(107 , 91, 2, 2, Vector2(117.5,5));

    MainCell main1_2 = MainCell(107 , 138, 2, 3, Vector2(5,53));
    MainCell main2_2 = MainCell(107 , 138, 2, 3, Vector2(61.5,53));
    MainCell main3_2 = MainCell(107 , 138, 2, 3, Vector2(117.5,53));
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
    double minDistance = double.infinity; // Start mit einer sehr großen Distanz
    MainCell? mainCell;

    maincells.forEach((MainCell element) {
      Vector2 position1 = element.absolutePosition;
      Vector2 position2 = Vector2(element.absolutePosition.x + element.width, element.absolutePosition.y + element.height);
      Vector2 center =(position2 + position1)  / 2;

      double distance = (ship.absolutePosition - center).length; // Verwendung von hypot für Distanzberechnung
      // Überprüfen, ob der aktuelle Abstand kleiner als der bisherige minimale Abstand ist

      print(center.toString());
      print(ship.absolutePosition.toString());

      if (distance < minDistance) {
        minDistance = distance; // Aktualisiere den minimalen Abstand
        mainCell = element;
        print("Minimale Entfernung: $minDistance");
      }
      print("Maximale Entfernung: $minDistance");

      // Der minimale Abstand ist jetzt in der Variable minDistance verfügbar

    });

    if (mainCell != null) { // Überprüfung auf null für mainCell
      mainCell?.addShip(ship);
    }
  }




}