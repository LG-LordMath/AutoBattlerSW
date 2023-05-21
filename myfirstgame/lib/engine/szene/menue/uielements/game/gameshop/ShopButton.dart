


import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/ships/basic/EnumShipClass.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/engine/basics/MyUIText.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../../ships/basic/BasicShip.dart';
import 'ShopLogic.dart';

class ShopButton extends Button


{
  late MyUIText uiText;
  late BasicShip tempbasicShip;
  late SpriteComponent spriteComponent;
  late Sprite? imagebasicShip;
  late    SpriteComponent spriteComponenticon;
  late int number;
  late SpriteComponent iconshipclass;

  ShopButton(Vector2 position, Vector2 sizeofImage, Function methode, this.number)
      :
    super(ImageLoader.sprites[EnumImages.UIIconCell]!, sizeofImage.x, sizeofImage.y,position, methode , "");



  @override
  bool onTapDown(TapDownInfo event)
  {
    try {
     // print("Button tapped"); // Add this line
      int tempcredits = gameRef.gameAutoBattle.player1.currentcredits - tempbasicShip.creditcost;
      if(tempcredits >= 0)
      {
        tempbasicShip.currentteam= 1;
        if(gameRef.gameAutoBattle.bottomBar.addShipToBar(tempbasicShip)){
          gameRef.gameAutoBattle.player1.currentcredits = tempcredits;
          gameRef.gameAutoBattle.tempshipshopbuyed[number] = false;
          destroy();
        }
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
   uiText.destroy();
   iconshipclass.removeFromParent();
   removeFromParent();



  }

  void setShip(BasicShip ship)
  {
    tempbasicShip = ship;
    spriteComponent.removeFromParent();
    setShipinShop();
  }


  void getShip()
  {

    tempbasicShip = gameRef.gameAutoBattle.shopLogic.getRandomShip(1);

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

  Future<void> setIconofShipclass(BasicShip ship)

  async {
   // iconshipclass?.removeFromParent();
    Sprite tempiconsprite;
    switch(ship.shipclass) {
      case EnumShipClass.Fighter:
        tempiconsprite = await Sprite.load(EnumShipClass.Fighter.Iconpath);

        break;
      case EnumShipClass.Figatte:
        tempiconsprite = await Sprite.load(EnumShipClass.Figatte.Iconpath);

        break;
      case EnumShipClass.Battleship:
        tempiconsprite = await Sprite.load(EnumShipClass.Battleship.Iconpath);

        break;
      case EnumShipClass.Mothership:
        tempiconsprite = await Sprite.load(EnumShipClass.Mothership.Iconpath);

        break;
      case EnumShipClass.Titan:
        tempiconsprite = await Sprite.load(EnumShipClass.Titan.Iconpath);

        break;
    }
    iconshipclass = SpriteComponent(sprite: tempiconsprite,
        position: Vector2(0, super.size.y),
        size: Vector2(20, 20));
    add(iconshipclass);

  }


}