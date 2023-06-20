


import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/spinner/Spinner.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:myfirstgame/game/backend/Option.dart';

class GameUIOption extends SpriteComponent with HasGameRef<MySpaceGame>


{

   MyTextField textFieldaccount = MyTextField(10, 80, "Nickname: none", Colors.white);
   MyTextField textFieldid= MyTextField(10, 100,      "ID: none", Colors.white);

   MyTextField textFielspinnerone= MyTextField(10, 200, "Music: ", Colors.white);
   MyTextField textFielspinnertwo = MyTextField(10, 260, "Sound: ", Colors.white);
   Spinner spinner = Spinner(Option.musicvolume, Vector2(100, 190));
   Spinner spinnertwo = Spinner(Option.soundvolume , Vector2(100, 250));
   MyTextField textFieldversion = MyTextField(10, 120,      "Version: 0.02 - 11", Colors.white);
   MyTextField textFieldcreator = MyTextField(10, 140,      "Creator(dis): LordMath#4323", Colors.white);
   @override
  onLoad()
  {
    parent = gameRef;
    sprite = ImageLoader.sprites[EnumImages.UICardTwo];
    position = Vector2(0, 40);
    size =  Vector2(gameRef.size[0], gameRef.size[1] / 1.45);

    spinner.position = Vector2(10, 140);
    spinnertwo.position = Vector2(10, 250);
//    add(textFielspinnerone);
 //   add(textFielspinnertwo);
//    add(spinner);
//    add(spinnertwo);
    add(textFieldaccount);
    add(textFieldid);
    add(textFieldversion);
    add(textFieldcreator);
  }


  destroy()
  {

   // Option.musicvolume = (spinner.spinnercounter).toInt();
    //Option.soundvolume = (spinnertwo.spinnercounter).toInt();
  //  spinner.destroy();
  //   textFielspinnerone.destroy();
   //  textFielspinnertwo.destroy();
     textFieldid.destroy();
     textFieldaccount.destroy();
     textFieldversion.destroy();
    textFieldcreator.destroy();
  //   spinnertwo.destroy();
     removeFromParent();
  }



}