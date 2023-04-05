



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../ships/BasicShip.dart';
import 'Button.dart';

class GameBottomBar extends SpriteComponent with HasGameRef<MySpaceGame>

{

  late Button btnShop;
  int counterMaxShips = 5;
  late SpriteComponent fieldOne;
  late SpriteComponent fieldTwo;
  late SpriteComponent fieldThree;
  late SpriteComponent fieldFour;
  late SpriteComponent fieldFive;

  @override
  Future<void> onLoad() async

  {
    super.onLoad();
    parent = gameRef;
    sprite = ImageLoader.sprites[EnumImages.UICardThree];
    position = Vector2(0, gameRef.size[1] / 1.2);
    size = Vector2(gameRef.size[0] , gameRef.size[1] / 5);
    btnShop = Button(ImageLoader.sprites[EnumImages.UIIconCellTwo]!, 50, 50, Vector2(10+ (gameRef.size[0]/ 6*5), gameRef.size[1] / 1.13), openshop, "");
    add(btnShop);

    fieldOne  = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UICardOne] , size: Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10), position: Vector2(5, 30));
    fieldTwo  = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UICardOne] , size: Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10), position: Vector2(5+ gameRef.size[0] / 6, 30));
    fieldThree  = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UICardOne] , size: Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10), position: Vector2(5+ (gameRef.size[0]/ 6*2), 30));
    fieldFour  = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UICardOne] , size: Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10), position: Vector2(5+ (gameRef.size[0]/ 6*3), 30));
    fieldFive  = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UICardOne] , size: Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10), position: Vector2(5+ (gameRef.size[0]/ 6*4), 30));
    add(fieldOne);
    add(fieldTwo);
    add(fieldThree);
    add(fieldFour);
    add(fieldFive);


    

  }





  bool addShipToBar(BasicShip pship)
  {

    BasicShip ship = (pship);

    if(counterMaxShips > 0){
      // gameRef.gameAutoBattle.player1.team.add(ship);
      ship.size = (Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10));
      switch (counterMaxShips){
        case 5:
          add(ship);
          ship.setPosition((Vector2(10, gameRef.size[1] / 1.13)));
          ship.rotateImage();
          counterMaxShips--;
          return true;
        case 4:
          add(ship);
          ship.position = (Vector2(10+ gameRef.size[0] / 6, gameRef.size[1] / 1.13));
          ship.rotateImage();
          counterMaxShips--;
          return true;
        case 3:
          add(ship);
          ship.position = (Vector2(10+ gameRef.size[0] / 6 *2, gameRef.size[1] / 1.13));
          ship.rotateImage();
          counterMaxShips--;
          return true;
        case 2:
          add(ship);
          ship.position = (Vector2(10+ gameRef.size[0] / 6 *3, gameRef.size[1] / 1.13));
          ship.rotateImage();
          counterMaxShips--;
          return true;
        case 1:
          add(ship);
          ship.position = (Vector2(10+ gameRef.size[0] / 6 *4, gameRef.size[1] / 1.13));
          ship.rotateImage();
          counterMaxShips--;
          return true;
      }

    }
    return false;

  }

  void openshop()
  {
    gameRef.gameAutoBattle.openOrcloseShop();
  }


  void destroy()

  {

    btnShop.destroy();
    gameRef.remove(fieldOne);
    gameRef.remove(fieldTwo);
    gameRef.remove(fieldThree);
    gameRef.remove(fieldFour);
    gameRef.remove(fieldFive);
    removeFromParent();
  }

}