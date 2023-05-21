


import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/szene/background/Background.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackgroundElements.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../background/AnimatedBackgroundElements.dart';

class MyAnimatedSzene extends SpriteComponent with HasGameRef<MySpaceGame>
{


  late double positionX;
  late double positionY;


  MyAnimatedSzene(this.positionX, this.positionY);



  @override
  Future<void> onLoad() async
  {
    parent = gameRef;
    sprite = Sprite(await Flame.images.load("background/space1.png"));
    position = Vector2(positionX, positionY);
    size = Vector2(gameRef.size[0], gameRef.size[1] / 1.4);
    addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements.AnimatedElementPlanetGas1);
    addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements.AnimatedElementPlanetGas2);
    addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements.AnimatedElementBlackHole1);
    addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements.AnimatedElementPlanetGas3);

  }

  void addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements elements)
  {
    Random random = new Random();
    int sizex = random.nextInt(size.x.toInt()-100);
    int sizey = random.nextInt(size.y.toInt()-100);

    AnimatedBackgroundElements element = AnimatedBackgroundElements(elements);
    element.position = Vector2(sizex.toDouble(), sizey.toDouble());
    int sizeelementx = random.nextInt(70);
    int sizeelementy = random.nextInt(70);
    element.size = Vector2(sizeelementx.toDouble(), sizeelementy.toDouble());
    add(element);
  }


  void destroy()
  {
    gameRef.remove(this);
  }


}