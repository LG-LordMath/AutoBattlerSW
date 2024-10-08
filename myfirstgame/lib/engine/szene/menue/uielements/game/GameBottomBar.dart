



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../ships/basic/BasicShip.dart';
import '../../../../basics/Button.dart';

class GameBottomBar extends SpriteComponent with HasGameRef<MySpaceGame>

{

  late Button btnShop;
  //int counterMaxShips = 5;
  late SpriteComponent fieldOne;
  late SpriteComponent fieldTwo;
  late SpriteComponent fieldThree;
  late SpriteComponent fieldFour;
  late SpriteComponent fieldFive;

  bool fieldOneismanned = false;
  bool fieldTwoismanned = false;
  bool fieldThreeismanned = false;
  bool fieldFourismanned = false;
  bool fieldFiveismanned = false;

  List<BasicShip> tempships = [];



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


  bool isFull(){

    if(fieldOneismanned && fieldTwoismanned &&  fieldThreeismanned && fieldFourismanned && fieldFiveismanned) {
      return true;
    }
    return false;
  }


  bool addShipToBar(BasicShip pship)
  {
      BasicShip ship = (pship);
      ship.size = (Vector2(gameRef.size[0] / 6, gameRef.size[1] / 10));
      if(settingShipOnPosition(ship))
      {
          return true;
      }
    return false;

  }


  removeship(BasicShip ship)
  {
    tempships.remove(ship);
    switch(ship.bottombarposition)
    {
      case 1:
        fieldOneismanned = false;
        break;
      case 2:
        fieldTwoismanned = false;
        break;
      case 3:
        fieldThreeismanned = false;
        break;
      case 4:
        fieldFourismanned = false;
        break;
      case 5:
        fieldFiveismanned = false;
        break;
    }
    ship.removeFromParent();
  }
    

  void openshop()
  {
    gameRef.gameAutoBattle.openOrcloseShop();
  }


  void destroy()

  {

    btnShop.destroy();
    /*
    gameRef.remove(fieldOne);
    gameRef.remove(fieldTwo);
    gameRef.remove(fieldThree);
    gameRef.remove(fieldFour);
    gameRef.remove(fieldFive);
     */
    removeAll(children);
    removeFromParent();
  }






  bool settingShipOnPosition(BasicShip ship)

  {
    if(!fieldOneismanned)
    {
      if(!ship.isMounted)
      {
        add(ship);
        ship.rotateImage();
      }
      ship.setBottonBarPosition(1);
      ship.position = (Vector2(10 + gameRef.size[0] / 6 *4, gameRef.size[1] / 1.13));

      //counterMaxShips--;
      fieldOneismanned = true;
      tempships.add(ship);
      return true;
    }
    else if(!fieldTwoismanned)
    {
      if(!ship.isMounted){
        add(ship);
        ship.rotateImage();
      }
      ship.setBottonBarPosition(2);
      ship.position = (Vector2(10+ gameRef.size[0] / 6 *3, gameRef.size[1] / 1.13));

      //counterMaxShips--;
      fieldTwoismanned = true;
      tempships.add(ship);
      return true;
    }
    else if(!fieldThreeismanned)
    {
      if(!ship.isMounted){
        add(ship);
        ship.rotateImage();
      }
      ship.setBottonBarPosition(3);
      ship.position = (Vector2(10+ gameRef.size[0] / 6 *2, gameRef.size[1] / 1.13));

     // counterMaxShips--;
      fieldThreeismanned = true;
      tempships.add(ship);
      return true;
    }
    else if(!fieldFourismanned)
    {
      if(!ship.isMounted){
        add(ship);
        ship.rotateImage();
      }
      ship.setBottonBarPosition(4);
      ship.position = (Vector2(10+ gameRef.size[0] / 6, gameRef.size[1] / 1.13));

     // counterMaxShips--;
      fieldFourismanned = true;
      tempships.add(ship);
      return true;
    }
    else if(!fieldFiveismanned)
    {
      if(!ship.isMounted){
        add(ship);
        ship.rotateImage();
      }
      ship.setBottonBarPosition(5);
      ship.setPosition((Vector2(10, gameRef.size[1] / 1.13)));

     //counterMaxShips--;
      fieldFiveismanned = true;
      tempships.add(ship);
      return true;
    }
    return false;
  }








}