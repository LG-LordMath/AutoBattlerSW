
import 'dart:math';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/background/AnimatedBackgroundElements.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackground.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'EnumGlobalsBackgroundElements.dart';




class Background extends SpriteComponent with HasGameRef<MySpaceGame>
{


  late int _displaysizeX;
  late int _displaysizeY;

  @override
  Future<void> onLoad() async
  {
    Random random = new Random();
    int randomNumber = random.nextInt(5);
    print("Nummber: " + randomNumber.toString());
    switch (randomNumber){
      case 1:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundOne.path);
        size = gameRef.size;
        break;
      case 2:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundTwo.path);
        size = gameRef.size;
        break;
      case 3:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundThree.path);
        size = gameRef.size;
        break;
      case 4:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundFour.path);
        size = gameRef.size;
        break;
      case 5:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundFive.path);
        size = gameRef.size;
        break;
      default:
        sprite = await gameRef.loadSprite(EnumGlobalsBackground.backgroundFive.path);
        size = gameRef.size;
        break;
    }
  }

  void setSizes(int sizeX, int sizeY){
    _displaysizeX = sizeX;
    _displaysizeY = sizeY;
  }


  void addingAnimatedBackgroundElement(EnumGlobalsBackgroundElements elements)
  {
    Random random = new Random();
    int sizex = random.nextInt(_displaysizeX - 200);
    int sizey = random.nextInt(_displaysizeY - 50);

    AnimatedBackgroundElements element = AnimatedBackgroundElements(elements);
    element.position = Vector2(sizex.toDouble(), sizey.toDouble());
    add(element);
  }
  void addingBackground()
  {

  }

}