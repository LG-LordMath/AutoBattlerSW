


import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';

class ShopButton extends Button


{
  late MyUIText uiText;


  ShopButton(Vector2 position, Vector2 sizeofImage, Function methode):
    super(ImageLoader.sprites[EnumImages.UIIconCell]!, sizeofImage.x, sizeofImage.y,position, methode , "");


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    uiText = MyUIText(ImageLoader.sprites[EnumImages.IconCredits]!, 40, 40, Vector2(super.positionofButton.x + super.size.x / 1.5,super.positionofButton.y + super.size.y / 1.5), "", Colors.black);

    add(uiText);
    uiText.setText("9");
  }

  @override
  void destroy(){
    uiText.destroy();
    super.destroy();
  }


  void getShip()
  {
    int republic;
    int imperium;
    int rebell;
    int cis;


   // gameRef.gameAutoBattle.player1.team.forEach((element) {element. });
  }


}