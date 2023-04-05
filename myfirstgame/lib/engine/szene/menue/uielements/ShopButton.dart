


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

import '../../../ships/BasicShip.dart';
import '../../../ships/republicships/RepublicShipsLoader.dart';

class ShopButton extends Button


{
  late MyUIText uiText;
  late BasicShip tempbasicShip;
  late SpriteComponent spriteComponent;
  late Sprite? imagebasicShip;


  ShopButton(Vector2 position, Vector2 sizeofImage, Function methode)
      :
    super(ImageLoader.sprites[EnumImages.UIIconCell]!, sizeofImage.x, sizeofImage.y,position, methode , "");



  @override
  bool onTapDown(TapDownInfo event) {
    try {
      print("Button tapped"); // Add this line
      if(gameRef.gameAutoBattle.bottomBar.addShipToBar(tempbasicShip)){

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


  void getShip()
  {

    int republic = 25;
    int imperium = 25;
    int rebell = 25;
    int cis = 25;
   gameRef.gameAutoBattle.player1.team.forEach((element) {

       switch (element.nation) {
         case EnumNation.Republic:
           if(republic<=74){
             republic += 15;
             imperium -= 5;
             rebell -= 5;
             cis -= 5;
           }
           break;
         case EnumNation.Imperium:
           if(imperium<=74) {
             imperium += 15;
             republic -= 5;
             rebell -= 5;
             cis -= 5;
           }
           break;
         case EnumNation.Rebellen:
           if(rebell<=74) {
             rebell += 15;
             imperium -= 5;
             republic -= 5;
             cis -= 5;
           }
           break;
         case EnumNation.CIS:
           if(cis<=74) {
             cis += 15;
             imperium -= 5;
             rebell -= 5;
             republic -= 5;
           }
           break;
       }

   });
    var random = Random();
    var randomNumber = random.nextInt(100);
    var randomNumberShip;

    if (randomNumber < republic) {
      print("Republic hat gewonnen!");
      randomNumberShip = random.nextInt(RepublicShipsLoader.republicships.length );
      imagebasicShip = RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(randomNumberShip)]?.getimage;
      tempbasicShip =  RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(randomNumberShip)]!;
      RepublicShipsLoader rep = RepublicShipsLoader();
      rep.reloadObject(EnumRepublicShips.values.elementAt(randomNumberShip));
      spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
      add(spriteComponent);
      uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
     } else if (randomNumber < republic + imperium) {
      print("Imperium hat gewonnen!");
      randomNumberShip = random.nextInt(GalaticEmpireShipsLoader.empireships.length );
      imagebasicShip = GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(randomNumberShip)]?.getimage;
      tempbasicShip =  GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(randomNumberShip)]!;
      GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
      rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(randomNumberShip));
      spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
      add(spriteComponent);
      uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
    } else if (randomNumber < republic + imperium + rebell) {
      print("Rebell hat gewonnen!");
    } else {
      print("CIS hat gewonnen!");
      randomNumberShip = random.nextInt(SeperatistCISShipLoader.cisships.length );
      imagebasicShip = SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(randomNumberShip)]?.getimage;
      tempbasicShip =  SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(randomNumberShip)]!;
      SeperatistCISShipLoader cisShipLoader = SeperatistCISShipLoader();
      cisShipLoader.reloadObject(EnumCISShips.values.elementAt(randomNumberShip));
      spriteComponent = SpriteComponent(position: Vector2(15, 10), sprite:  imagebasicShip, size: Vector2(60,60));
      add(spriteComponent);
      uiText.setTextwPos(tempbasicShip.creditcost.toString(),  Vector2(super.positionofButton.x + super.size.x / 2.35,super.positionofButton.y + super.size.y / 1.1));
    }
  }





}