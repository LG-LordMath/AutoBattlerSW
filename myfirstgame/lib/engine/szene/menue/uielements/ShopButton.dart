


import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/nations/NationLoader.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';

import '../../../ships/BasicShip.dart';
import '../../../ships/republicships/RepublicShipsLoader.dart';

class ShopButton extends Button


{
  late MyUIText uiText;
  late BasicShip basicShip;

  ShopButton(Vector2 position, Vector2 sizeofImage, Function methode):
    super(ImageLoader.sprites[EnumImages.UIIconCell]!, sizeofImage.x, sizeofImage.y,position, methode , "");


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    uiText = MyUIText(ImageLoader.sprites[EnumImages.IconCredits]!, 40, 40, Vector2(super.positionofButton.x + super.size.x / 3.3,super.positionofButton.y + super.size.y / 1.2), "", Colors.black);

    getShip();
    add(uiText);
 }

  @override
  void destroy(){
    uiText.destroy();
    super.destroy();
  }


  void getShip()
  {
    int republic = 25;
    int imperium = 25;
    int rebell = 25;
    int cis = 25;




   gameRef.gameAutoBattle.player1.team.forEach((element) {


     switch (element.nation)
     {
       case EnumNation.Republic:
         republic += 15;
         imperium -= 5;
         rebell -= 5;
         cis -= 5;
         break;
       case EnumNation.Imperium:
         imperium += 15;
         republic -= 5;
         rebell -= 5;
         cis -= 5;
         break;
       case EnumNation.Rebellen:
         rebell += 15;
         imperium -= 5;
         republic -= 5;
         cis -= 5;
         break;
       case EnumNation.CIS:
         cis += 15;
         imperium -= 5;
         rebell -= 5;
         republic -= 5;
         break;
     }



   });
    var random = Random();
    var randomNumber = random.nextInt(100);
    var randomNumberShip;
    if (randomNumber < republic) {
      print("Republic hat gewonnen!");

     // randomNumberShip = random.nextInt(RepublicShipsLoader.republicships.length );
      randomNumberShip = 0;
      var basicShip = RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(1)]!;
      print(basicShip);


    } else if (randomNumber < republic + imperium) {
      print("Imperium hat gewonnen!");
    } else if (randomNumber < republic + imperium + rebell) {
      print("Rebell hat gewonnen!");
    } else {
      print("CIS hat gewonnen!");
    }

/*

    SpriteComponent image = SpriteComponent(sprite: basicShip.image, position: Vector2(super.positionofButton.x + super.size.x / 3.3,super.positionofButton.y + super.size.y / 1.2), size: Vector2(30, 30));
    add(image);
    uiText.setTextwPos(basicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
*/


  }


}