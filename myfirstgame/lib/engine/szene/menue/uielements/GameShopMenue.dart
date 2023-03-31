



import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/ShopButton.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../loader/ImageLoader.dart';

class GameShopMenue  extends SpriteComponent with HasGameRef<MySpaceGame>

{






 late ShopButton btnOne;
 late ShopButton btnTwo;
 late ShopButton btnThree;

 late Button rerollButton;

 @override
 Future<void> onLoad() async
 {
  parent = gameRef;
  sprite = ImageLoader.sprites[EnumImages.UICardTwo];
  position = Vector2(0, gameRef.size[1] / 2 - 200);
  size = Vector2(gameRef.size[0], gameRef.size[1] / 5);
 Sprite? loadingimage = ImageLoader.sprites[EnumImages.IconLoading];

  rerollButton = Button(loadingimage!, 50, 50, Vector2(position.x + 320, position.y + 90), reroll, "1");
  add(rerollButton);


  rerollButton.setTextColor(Colors.black);
  rerollButton.setText("1");

  btnOne = (ShopButton(Vector2(position.x + 20, position.y + 20), Vector2(90, 90), addShiptoGame));
  btnTwo = (ShopButton(Vector2(position.x + 120, position.y + 20), Vector2(90, 90), addShiptoGame));
  btnThree = (ShopButton(Vector2(position.x + 220, position.y + 20), Vector2(90, 90), addShiptoGame));
  add(btnOne);
  add(btnTwo);
  add(btnThree);


 }




void reroll()
{

 btnOne.destroy();
 btnTwo.destroy();
 btnThree.destroy();
 btnOne = (ShopButton(Vector2(position.x + 20, position.y + 20), Vector2(90, 90), addShiptoGame));
 btnTwo = (ShopButton(Vector2(position.x + 120, position.y + 20), Vector2(90, 90), addShiptoGame));
 btnThree = (ShopButton(Vector2(position.x + 220, position.y + 20), Vector2(90, 90), addShiptoGame));
 add(btnOne);
 add(btnTwo);
 add(btnThree);

}


 void addShiptoGame(){
   print("add ship to temp side bar");
 }


  void destroy()
  {
   rerollButton.destroy();
   btnOne.destroy();
   btnTwo.destroy();
   btnThree.destroy();
   gameRef.remove(this);
  }










}