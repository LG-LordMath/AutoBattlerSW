


import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/basics/MyUIText.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../../basics/Button.dart';

class MyGameChoise extends PositionComponent with HasGameRef<MySpaceGame>


{

  late Vector2 _size;
  late Vector2 _position;
  late Button btnGameBot;
//  late Button btnGameOnline;
  late  MyUIText textmatch;
  late TimerComponent timer =  timer = TimerComponent(period: 3, repeat: false);
  bool _searchMatchBot = false;
  bool _searchMatchOnline = false;

MyGameChoise(this._position, this._size);


  @override
  Future<void> onLoad() async

  {
    parent = gameRef;
    position = _position;
    size = _size;
    Sprite? sp = ImageLoader.sprites[EnumImages.UIButtonOne];
    btnGameBot = Button(sp!,
        gameRef.size[0] - 50, gameRef.size[1] / 9.5,
        Vector2(30, 100), gamestartBot,
        "Player VS Bot");

    add(btnGameBot);
    //btnGameOnline = Button(sp,
     //   gameRef.size[0] - 50, gameRef.size[1] / 9.5,
      //  Vector2(30, 200), gamestartPlayer,
       // "PvP (nicht verfügbar)");


   //7 add(btnGameOnline);



    Sprite? sptwo= ImageLoader.sprites[EnumImages.UICardTwo];
    textmatch = MyUIText(sptwo!,gameRef.size[0] - 50, gameRef.size[1] / 9.5,
        Vector2(30, 100), "Match: ", Colors.white);


  }

  void destroy()
  {

    if(!btnGameBot.isRemoved){

      btnGameBot.destroy();
    }
   // if(!btnGameOnline.isRemoved){

   //   btnGameOnline.destroy();
  //  }
    if(timer != null)
    {
      timer.removeFromParent();

    }

    if(_searchMatchBot || _searchMatchOnline) {
      textmatch.destroy();
    }
    removeFromParent();
  }


  @override
  void update(double dt)
  {
    if(_searchMatchBot){
      int lefttime = 3 - timer.timer.current.toInt();
      textmatch.setText("Match: " + lefttime.toString());
      timer.removeOnFinish;
      if(lefttime <= 0){
        starteBotMatch();
      }
    }


  }

  void gamestartBot()
  {
    if(gameRef.mainMenue.charSelection.chars.commanders.elementAt(gameRef.mainMenue.charSelection.currentposition).isEnable){
      _searchMatchBot = true;
      timer = TimerComponent(period: 5, repeat: false);
      add(timer);
      gameRef.mainMenue.charSelection.disablearrows();
      if(!btnGameBot.isRemoved){
        btnGameBot.destroy();
      }
      add(textmatch);
    }else{

      btnGameBot.textField.text = "Commander locked";
      timer = TimerComponent(period: 1, repeat: false, onTick: Buttontext);
      add(timer);
      _searchMatchBot = false;
      }

    }

    //  if(!btnGameOnline.isRemoved){
  //      btnGameOnline.destroy();
  //    }
  void Buttontext()
  {
    btnGameBot.textField.text = "Player VS Bot";

  }



  void gamestartPlayer()
  {

  }

  void starteBotMatch()
  {
    destroy();
    gameRef.startGameAutoBattleAi();
    print("Game Start...");


  }


}