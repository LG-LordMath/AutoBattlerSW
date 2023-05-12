

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class Spinner extends SpriteComponent with HasGameRef<MySpaceGame>




{

  late int spinnercounter;
  int spinnercountertemp  = 0;
  late  MyTextField text;
  late Button btnhoch;
  late Button btnrunter;
  late Vector2 positionComponent;

  Spinner(this.spinnercounter, this.positionComponent);


  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    parent = gameRef;
    sprite = ImageLoader.sprites[EnumImages.UIIconCellThree];
    size = Vector2(50, 50);
    position = positionComponent;
    Sprite spriteimage = ImageLoader.sprites[EnumImages.IconPfeil]!;
    text = MyTextField(position.x + 5, position.y + 10, spinnercounter.toString(), Colors.white);
    btnhoch = Button(spriteimage, 20, 10, Vector2(positionComponent.x + 15 , positionComponent.y), countgerup, "");
    btnrunter = Button(spriteimage, 20, 10, Vector2(positionComponent.x + 35 , positionComponent.y + 50), countgerdown, "");




    add(btnhoch);
    add(text);
    add(btnrunter);
    final effect = RotateEffect.to(
      tau/2,
      EffectController(duration: 0), );
    btnrunter.add(effect);



  }

  @override
  void update(double dt)
  {
    super.update(dt);
    if(spinnercountertemp != spinnercounter){
      spinnercountertemp = spinnercounter;
      text.destroy();
      text = MyTextField(position.x + 5, position.y + 10, spinnercounter.toString(), Colors.white);
      add(text);
    }
  }


  void countgerup()
  {
    if(spinnercounter != 200){
      spinnercounter+=10;
    }

  }
  void countgerdown()
  {
    if(spinnercounter != 0)
    {
      spinnercounter-=10;
    }
  }

  destroy(){
    text.destroy();
    btnrunter.destroy();
    btnhoch.destroy();
    removeFromParent();
  }



}