



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
  position = Vector2(0, gameRef.size[1] / 3 );
  size = Vector2(gameRef.size[0], gameRef.size[1] / 5);
 Sprite? loadingimage = ImageLoader.sprites[EnumImages.IconLoading];
  rerollButton = Button(loadingimage!, gameRef.size[0] / 9, gameRef.size[0] / 9, Vector2(position.x + gameRef.size[0] / 1.3, position.y + 80), reroll, "1");
  add(rerollButton);
  rerollButton.setTextColor(Colors.black);
  rerollButton.setText("1");
  btnOne = (ShopButton(Vector2(position.x + gameRef.size[0] / 16, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing));
  btnTwo = (ShopButton(Vector2(position.x + gameRef.size[0] / 3.5, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8),donothing ));
  btnThree = (ShopButton(Vector2(position.x + gameRef.size[0] / 1.95, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing));
  add(btnOne);
  add(btnTwo);
  add(btnThree);


 }




void reroll()
{

 if(!btnOne.isRemoved){
  btnOne.destroy();
 }
 if(!btnTwo.isRemoved){
  btnTwo.destroy();
 }
 if(!btnThree.isRemoved){
  btnThree.destroy();
 }



 btnOne = (ShopButton(Vector2(position.x + gameRef.size[0] / 16, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing));
 btnTwo = (ShopButton(Vector2(position.x + gameRef.size[0] / 3.5, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing));
 btnThree = (ShopButton(Vector2(position.x + gameRef.size[0] / 1.95, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing));
 add(btnOne);
 add(btnTwo);
 add(btnThree);

}



  void destroy()
  {
   rerollButton.destroy();

   if(!btnOne.isRemoved){
    btnOne.destroy();
   }
   if(!btnTwo.isRemoved){
    btnTwo.destroy();
   }
   if(!btnThree.isRemoved){
    btnThree.destroy();
   }
   gameRef.remove(this);
  }


  void donothing(){

  }








}