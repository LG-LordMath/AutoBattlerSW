


import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/EnumGalaticEmpireShips.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/GalacticEmpireShipsLoader.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SeperatistCISShipLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../ships/BasicShip.dart';
import 'ShopLogic.dart';

class ShopButton extends Button


{
  late MyUIText uiText;
  late BasicShip tempbasicShip;
  late SpriteComponent spriteComponent;
  late Sprite? imagebasicShip;
  late    SpriteComponent spriteComponenticon;
  late int number;

  ShopButton(Vector2 position, Vector2 sizeofImage, Function methode, this.number)
      :
    super(ImageLoader.sprites[EnumImages.UIIconCell]!, sizeofImage.x, sizeofImage.y,position, methode , "");



  @override
  bool onTapDown(TapDownInfo event)
  {
    try {
      print("Button tapped"); // Add this line
      if(gameRef.gameAutoBattle.bottomBar.addShipToBar(tempbasicShip)){
        gameRef.gameAutoBattle.tempshipshopbuyed[number] = false;
        destroy();

      }
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }





  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    uiText = MyUIText(ImageLoader.sprites[EnumImages.IconCredits]!, 40, 40, Vector2(super.positionofButton.x + super.size.x / 3.3,super.positionofButton.y + super.size.y / 1.2), "", Colors.black);
    add(uiText);
    getShip();
 }

 @override
  void destroy(){
   textField.destroy();
   gameRef.remove(this);
   uiText.destroy();

  }

  void setShip(BasicShip ship)
  {
    tempbasicShip = ship;
    spriteComponent.removeFromParent();
    setShipinShop();
  }


  void getShip()
  {

    tempbasicShip = gameRef.gameAutoBattle.shopLogic.getRandomShip();

    setShipinShop();

  }


  void setShipinShop()
  {
    imagebasicShip = tempbasicShip.getimage;
    switch (tempbasicShip.nation)
    {
      case EnumNation.Republic:
        spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
        add(spriteComponent);
        uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
        Sprite? iconfraction = ImageLoader.sprites[EnumImages.IconRepublic];
        spriteComponenticon = SpriteComponent(sprite: iconfraction, position:  Vector2(0, 0), size: Vector2(20, 20));
        add(spriteComponenticon);
        break;
      case EnumNation.Imperium:
        spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
        add(spriteComponent);
        uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
        Sprite? iconfraction = ImageLoader.sprites[EnumImages.IconImperium];
        spriteComponenticon = SpriteComponent(sprite: iconfraction, position:  Vector2(0, 0), size: Vector2(20, 20));
        add(spriteComponenticon);
        break;
      case EnumNation.Rebellen:
        break;
      case EnumNation.CIS:
        spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
        add(spriteComponent);
        uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
        Sprite? iconfraction = ImageLoader.sprites[EnumImages.IconSeperatisten];
        spriteComponenticon = SpriteComponent(sprite: iconfraction, position:  Vector2(0, 0), size: Vector2(20, 20));
        add(spriteComponenticon);
        break;


    }
  }


}