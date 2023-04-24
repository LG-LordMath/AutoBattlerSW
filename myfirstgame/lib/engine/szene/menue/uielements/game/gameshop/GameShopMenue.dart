



import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../loader/ImageLoader.dart';
import 'ShopButton.dart';


class GameShopMenue  extends SpriteComponent with HasGameRef<MySpaceGame>

{






 late ShopButton btnOne;
 late ShopButton btnTwo;
 late ShopButton btnThree;

 late Button rerollButton;


 GameShopMenue();


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


  if(gameRef.gameAutoBattle.tempshipshopbuyed[0]){
   btnOne = (ShopButton(Vector2(position.x + gameRef.size[0] / 16, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing,0));
   add(btnOne);
   if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty) {
    btnOne.setShip(gameRef.gameAutoBattle.tempshipsshop[0]);
   }
  }
  if(gameRef.gameAutoBattle.tempshipshopbuyed[1]){
   btnTwo = (ShopButton(Vector2(position.x + gameRef.size[0] / 3.5, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing,1));
   add(btnTwo);
   if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty) {
    btnTwo.setShip(gameRef.gameAutoBattle.tempshipsshop[1]);
   }
  }

  if(gameRef.gameAutoBattle.tempshipshopbuyed[2]){
   btnThree = (ShopButton(Vector2(position.x + gameRef.size[0] / 1.95, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing, 2));

   add(btnThree);
   if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty){
    btnThree.setShip(gameRef.gameAutoBattle.tempshipsshop[2]);
   }
  }
 }




void reroll()
{
 int tempcredits = gameRef.gameAutoBattle.player1.currentcredits - 1;
 if(tempcredits >= 0)
 {
  if(btnOne!=null){
   if(!btnOne.isRemoved)
   {
    btnOne.destroy();
   }
  }
  if(btnTwo!=null) {
   if (!btnTwo.isRemoved) {
    btnTwo.destroy();
   }
  }
  if(btnThree!=null) {
   if (!btnThree.isRemoved) {
    btnThree.destroy();
   }
 }
  gameRef.gameAutoBattle.tempshipshopbuyed[0] = true;
  gameRef.gameAutoBattle.tempshipshopbuyed[1] = true;
  gameRef.gameAutoBattle.tempshipshopbuyed[2] = true;
  btnOne = (ShopButton(Vector2(position.x + gameRef.size[0] / 16, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing, 0));
  btnTwo = (ShopButton(Vector2(position.x + gameRef.size[0] / 3.5, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing, 1));
  btnThree = (ShopButton(Vector2(position.x + gameRef.size[0] / 1.95, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing, 2));


  add(btnOne);
  add(btnTwo);
  add(btnThree);
  gameRef.gameAutoBattle.tempshipsshop[0] = btnOne.tempbasicShip;
  gameRef.gameAutoBattle.tempshipsshop[1] = btnTwo.tempbasicShip;
  gameRef.gameAutoBattle.tempshipsshop[2] = btnThree.tempbasicShip;
  gameRef.gameAutoBattle.player1.currentcredits--;
 }





}



  void destroy()
  {
   if(!rerollButton.isRemoved) {
    rerollButton.destroy();

   }

   if(gameRef.gameAutoBattle.tempshipshopbuyed[0] == true){
    if(!btnOne.isRemoved)
    {
     btnOne.destroy();
    }
   }
   if(gameRef.gameAutoBattle.tempshipshopbuyed[1] == true) {
    if (!btnTwo.isRemoved) {
     btnTwo.destroy();
    }
   }
   if(gameRef.gameAutoBattle.tempshipshopbuyed[2] == true) {
    if (!btnThree.isRemoved) {
     btnThree.destroy();
    }
   }
   if(!isRemoved){
    removeFromParent();
   }

  }


  void donothing(){

  }








}