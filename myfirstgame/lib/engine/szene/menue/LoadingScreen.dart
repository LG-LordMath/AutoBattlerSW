




import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/music/MyMusicPlayer.dart';
import 'package:myfirstgame/engine/ships/galacticempireships/GalacticEmpireShipsLoader.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SeperatistCISShipLoader.dart';
import 'package:myfirstgame/engine/szene/background/Background.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/MyUIText.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../ships/republicships/RepublicShipsLoader.dart';

class LoadingScreen extends SpriteComponent with HasGameRef<MySpaceGame>


{
  bool _finishloading = false;
  bool _loadingimages = false;
  bool _loadingAudio = false;
  bool _loadingAnimations = false;
  bool _loadingShips = false;

  final effect = ScaleEffect.by(Vector2.all(1.2), EffectController(duration: 3));
  late  Button btn;

  int percentage  = 0;
  bool _isplayingmusic = false;
  late MyUIText textfieldwithUi;
  late  MyUIText textFieldwithUITwo;
  @override
  Future<void> onLoad() async
  {

      sprite = Sprite(await Flame.images.load("background/space1.png"));
      position  = Vector2(0, 0 );
      size = Vector2(gameRef.size[0] , gameRef.size[1]);
      Sprite spi = Sprite(await Flame.images.load('elements/normal/UICard2.png'));
      textfieldwithUi =  MyUIText(spi, gameRef.size[0] / 1.35, gameRef.size[1] / 3.7, Vector2(position.x + 25 , position.y + size.y / 5  ), getRandomOpeningQuotes(), Colors.lightBlue);
      textfieldwithUi.add(effect);
      Sprite spt = Sprite(await Flame.images.load('elements/normal/UICard1.png'));
      textFieldwithUITwo =  MyUIText(spt, gameRef.size[0] / 1.15, gameRef.size[1] / 3.7, Vector2(position.x + 30 , position.y + size.y / 1.5  ), "Random Tipp:" + getRandomToolTipp(), Colors.white);




     Sprite sp = Sprite(await Flame.images.load('ButtonN.png'));

      btn =  Button(sp,  gameRef.size[0] / 1.18,  gameRef.size[1] / 9.4,  Vector2(position.x + 33, position.y + size.y  / 1.12), finishLoadingAssets,  "Loading  Ressources...");

      if(!_isplayingmusic)
      {
        FlameAudio.bgm.play('music/FertigCloneWarsBegin.ogg');//.timeout(Duration(minutes: 1, seconds: 10));
        _isplayingmusic = true;
      }


      add(textfieldwithUi);
      add(textFieldwithUITwo);
      add(btn);



      //finishloading = true;

  }
  @override
  void update(double dt)
  {
  //  print("Laden [image | music | animations | ships]: "+ _loadingimages.toString() + ", "+ _loadingAudio.toString()+ ", "+ _loadingAnimations.toString()+ ", "+_loadingShips.toString());
    if(_loadingimages && _loadingAudio &&  _loadingAnimations && _loadingShips){
      btn.setText("Play");
    }else{
      loadData();
    }


  }
  void finishLoadingAssets()
  {

    if(_loadingimages && _loadingAudio &&  _loadingAnimations)
    {
      gameRef.bulletLaserLoader.load();
      gameRef.bulletRocketLoader.load();
      if(FlameAudio.bgm.isPlaying)
      {
        FlameAudio.bgm.stop();
      }
     // print("laod assets, screen: x" + size[1].toString() + ", y "+size[0].toString() );
      _finishloading = true;
      textfieldwithUi.destroy();
      textFieldwithUITwo.destroy();
      btn.destroy();
      gameRef.loadingScreen.removeFromParent();
      gameRef.startMainMenue();


    }

  }



  bool get finishloading => _finishloading;

  set finishloading(bool value) {
    _finishloading = value;
  }

  String getRandomToolTipp()
  {
    String tipp = "";
    Random random = new Random();
    int randomNumber = random.nextInt(5);
    switch (randomNumber){
      case 1:
        tipp = "\nMutterschiffe können \nkleinere Raumschiffe\nspawnen.";
        break;
      case 2:
        tipp = "\nEs gibt verschiedene \nArten von Waffen:\nIonen, Laser, Rockets";
        break;
      case 3:
        tipp = "\nMansche Raumschiffe\nhaben keine Schilde.";
        break;
      case 4:
        tipp = "\nAlle [R]-Credits\naufeinmal auszugeben\nist manchmal nicht klug!";
        break;
      case 5:
        tipp = "\nLevel deine Schiffe\ndurch doppellden Kauf\nauf.";
        break;
      default:
        tipp = "\nBenutze immer Schiffe \nvon der selben Nation.";
        break;
    }

    return tipp;
  }


  String getRandomOpeningQuotes(){
    String quote = "";
    Random random = new Random();
    int randomNumber = random.nextInt(5);
    switch (randomNumber){
      case 1:
        quote = " The truth about yourself \n"
                " is always the hardest \n"
                " to accept.";
        break;
      case 2:
        quote = " Never become desperate \n"
                " enough to trust the \n "
                " untrustworthy. ";
        break;
      case 3:
        quote = " Who’s the more foolish,\n"
                " the fool or the fool \n"
                " who follows him?";
        break;
      case 4:
        quote = " Searching for the truth\n"
                " is easy. Accepting the \n"
                " truth is hard.";
        break;
      case 5:
        quote = "It is a rough road that \n"
                "leads to the heights of \n"
                 "greatness.";
        break;
      default:
        quote = " Fighting a war tests a \n"
                " soldier’s skills, defending\n"
                " his home tests a \n"
                " soldier’s heart.";
        break;
    }



    return quote;
  }

  void loadData()
  {

    if(!_loadingimages){
      try{
        ImageLoader imageLoader = ImageLoader();
        imageLoader.load();
        _loadingimages = true;
      } catch (exception)
      {
        print("image |fehler beim laden");
      }
    }
    if(!_loadingAudio){
      try{
        MyMusicPlayer musicplayer = MyMusicPlayer();
        musicplayer.load();
        _loadingAudio = true;
      } catch (exception)
      {
        print("music |fehler beim laden");
      }
    }
   if(!_loadingAnimations)
   {
     try{

       _loadingAnimations = true;
     } catch (exception)
     {
       print("animations |fehler beim laden");
     }
   }
    if(!_loadingShips && _loadingimages){
      try{
        RepublicShipsLoader republicShipsLoader = RepublicShipsLoader();
        republicShipsLoader.load();
        GalaticEmpireShipsLoader empireShipsLoader =GalaticEmpireShipsLoader();
        empireShipsLoader.load();
        SeperatistCISShipLoader cisShipLoader = SeperatistCISShipLoader();
        cisShipLoader.load();

        _loadingShips = true;
      } catch (exception)
      {
        print("ships |fehler beim laden");
      }
    }
  }
}