



import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../loader/ImageLoader.dart';
import 'ShopButton.dart';


class GameShopMenue  extends SpriteComponent with HasGameRef<MySpaceGame>

{






  ShopButton? btnOne;
  ShopButton? btnTwo;
  ShopButton? btnThree;

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
  if(gameRef.gameAutoBattle.tempshipshopbuyed.isEmpty)
  {
   reroll();
  }else{
   setButtons();
  }


 }

void setButtons()
{
 if(gameRef.gameAutoBattle.tempshipshopbuyed[0]){
  btnOne = (ShopButton(Vector2(position.x + gameRef.size[0] / 16, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing,0));

  add(btnOne!);
  if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty) {
   btnOne!.setShip(gameRef.gameAutoBattle.tempshipsshop[0]);
   btnOne!.setIconofShipclass(btnOne!.tempbasicShip);
  }
 }
 if(gameRef.gameAutoBattle.tempshipshopbuyed[1]){
  btnTwo = (ShopButton(Vector2(position.x + gameRef.size[0] / 3.5, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing,1));

  add(btnTwo!);
  if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty) {
   btnTwo!.setShip(gameRef.gameAutoBattle.tempshipsshop[1]);
   btnTwo!.setIconofShipclass(btnTwo!.tempbasicShip);
  }
 }

 if(gameRef.gameAutoBattle.tempshipshopbuyed[2]){
  btnThree = (ShopButton(Vector2(position.x + gameRef.size[0] / 1.95, position.y + 20), Vector2(gameRef.size[0] / 4.8, gameRef.size[0] / 4.8), donothing, 2));
  add(btnThree!);
  if(gameRef.gameAutoBattle.tempshipsshop.isNotEmpty){
   btnThree!.setShip(gameRef.gameAutoBattle.tempshipsshop[2]);
   btnThree!.setIconofShipclass(btnThree!.tempbasicShip);
  }
 }
}


void reroll()
{

 int tempcredits = gameRef.gameAutoBattle.player1.currentcredits - 1;
 if(tempcredits >= 0)
 {
  gameRef.gameAutoBattle.tempshipshopbuyed[0] = true;
  gameRef.gameAutoBattle.tempshipshopbuyed[1] = true;
  gameRef.gameAutoBattle.tempshipshopbuyed[2] = true;
  gameRef.gameAutoBattle.tempshipsshop[0] = gameRef.gameAutoBattle.shopLogic.getRandomShip(1);
  gameRef.gameAutoBattle.tempshipsshop[1] = gameRef.gameAutoBattle.shopLogic.getRandomShip(1);
  gameRef.gameAutoBattle.tempshipsshop[2] = gameRef.gameAutoBattle.shopLogic.getRandomShip(1);
  gameRef.gameAutoBattle.player1.currentcredits--;
  gameRef.gameAutoBattle.openOrcloseShop();
  gameRef.gameAutoBattle.openOrcloseShop();
 }

}



  void destroy()
  {
   if(!rerollButton.isRemoved) {
    rerollButton.destroy();

   }


   if(gameRef.gameAutoBattle.tempshipshopbuyed[0] == true){
    if(btnOne != null){
     if(!btnOne!.isRemoved)
     {
      btnOne!.destroy();
     }
    }

   }
   if(gameRef.gameAutoBattle.tempshipshopbuyed[1] == true) {
    if(btnTwo != null){
     if (!btnTwo!.isRemoved) {
      btnTwo!.destroy();
     }
    }

   }
   if(gameRef.gameAutoBattle.tempshipshopbuyed[2] == true) {
    if(btnThree != null){
     if (!btnThree!.isRemoved)
     {
      btnThree!.destroy();
     }
    }

   }
   if(!isRemoved){
    removeFromParent();
   }

  }
  void donothing(){}
}