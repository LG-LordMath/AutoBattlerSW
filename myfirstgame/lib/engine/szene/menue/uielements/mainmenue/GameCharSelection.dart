



import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:myfirstgame/engine/basics/textfield/MyTextField.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:myfirstgame/game/backend/commander/GameChars.dart';
import '../../../../basics/Button.dart';
import '../../../../nations/EnumNation.dart';

class GameCharSelection extends PositionComponent with HasGameRef<MySpaceGame>


{
  late Button _btnleft;
  late Button _btnright;
  GameChars chars = GameChars();
  int currentposition = 0;
  late int _lastposition;
  late SpriteComponent imagebox;

   SpriteComponent? _componentcommander;
   SpriteComponent? _componentnation;
  SpriteComponent? _componentlocked;
   MyTextField? _textFieldHp;
  MyTextField? _textFieldCreditsperRound;



  @override
  Future<FutureOr<void>> onLoad()
  async {

    Sprite? arrowleft = await Sprite.load('elements/normal/IconPfeillinks.png');
    Sprite? arrowright = await Sprite.load('elements/normal/IconPfeilrechts.png');
    _btnleft = Button(arrowleft, 50, 50, Vector2(0, gameRef.size.y / 2), leftactionbutton, "");
    _btnright = Button(arrowright, 50, 50, Vector2(gameRef.size.x - 50, gameRef.size.y / 2), righttactionbutton, "");
    add(_btnright);
    add(_btnleft);
    imagebox = SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UIIconCellThree],
        size: Vector2(gameRef.size.x / 1.5, gameRef.size.y / 3),
        position:  Vector2(gameRef.size.x /6, gameRef.size.y / 3));

    add(imagebox);
    chars.getOfflineChars();
    parent = gameRef;
    _lastposition = chars.commanders.length -1;


  }

  @override
  Future<void> update(double dt) async {
    // TODO: implement update
    super.update(dt);

    if(currentposition != _lastposition)
    {
      if(_componentcommander==null && _componentnation == null && _componentlocked == null){
        loadChar();

      }else{
        _componentcommander?.removeFromParent();
        _componentnation?.removeFromParent();
        _textFieldHp?.removeFromParent();
        _textFieldCreditsperRound?.removeFromParent();
        _componentlocked?.removeFromParent();
        loadChar();

      }
      _lastposition = currentposition;
    }
  }
  void leftactionbutton()
  {
    if(currentposition == 0){
      currentposition = chars.commanders.length - 1;
    }else{
      currentposition--;
    }
  }
  void righttactionbutton()
  {
    if(currentposition == chars.commanders.length - 1){
      currentposition = 0;
    }else{
      currentposition++;
    }
  }

  Future<void> loadChar()
  async {

    Sprite spritecommander = await Sprite.load(chars.commanders.elementAt(currentposition).commander.Iconpath);
  _componentcommander = SpriteComponent(sprite: spritecommander,
      size: Vector2(gameRef.size.x / 3, gameRef.size.y / 3),
      position: Vector2(gameRef.size.x /6, gameRef.size.y / 3) );

  Sprite? imagenation;
    switch(chars.commanders.elementAt(currentposition).commander.nation){
      case EnumNation.Republic:
        imagenation = ImageLoader.sprites[EnumImages.IconRepublic];
        break;
      case EnumNation.Rebellen:
        imagenation = ImageLoader.sprites[EnumImages.IconRebellen];
        break;
      case EnumNation.Imperium:
        imagenation = ImageLoader.sprites[EnumImages.IconImperium];
        break;
      case EnumNation.CIS:
        imagenation = ImageLoader.sprites[EnumImages.IconSeperatisten];
        break;
    }

    _componentnation = SpriteComponent(sprite:  imagenation,
        size: Vector2(gameRef.size.x / 6, gameRef.size.y / 8),
        position: Vector2(gameRef.size.x /1.53, gameRef.size.y / 2.95) );

    if(chars.commanders.elementAt(currentposition).isEnable)
    {
      _textFieldHp = MyTextField(gameRef.size.x /2, gameRef.size.y / 2, "Hp: "+ chars.commanders.elementAt(currentposition).commander.life.toString(),
          Colors.white);
      add(_textFieldHp!);
      _textFieldCreditsperRound = MyTextField(gameRef.size.x /2, gameRef.size.y / 1.8, "Income: "+ chars.commanders.elementAt(currentposition).commander.baseofIncomeperRound.toString(),
          Colors.white);
      add(_textFieldCreditsperRound!);
    }else
    {
      Sprite locked = await Sprite.load('elements/normal/IconLocked.png');
      _componentlocked = SpriteComponent(sprite: locked,
          size: Vector2(gameRef.size.x / 6, gameRef.size.y / 8),
        position: Vector2(gameRef.size.x /2.05, gameRef.size.y / 2.95) );
      add(_componentlocked!);
      _textFieldCreditsperRound = MyTextField(gameRef.size.x /2, gameRef.size.y / 2, "Locked",
          Colors.white);
      add(_textFieldCreditsperRound!);
    }


  add(_componentnation!);
  add(_componentcommander!);
  _lastposition = currentposition;
  }

  void disablearrows()
  {
    _btnleft.destroy();
    _btnright.destroy();
  }
  Future<void> enableearrows()
  async {

    if(_btnleft.isRemoved && _btnright.isRemoved  ){
      Sprite? arrowleft = await Sprite.load('elements/normal/IconPfeillinks.png');
      Sprite? arrowright = await Sprite.load('elements/normal/IconPfeilrechts.png');
      _btnleft = Button(arrowleft, 50, 50, Vector2(0, gameRef.size.y / 2), leftactionbutton, "");
      _btnright = Button(arrowright, 50, 50, Vector2(gameRef.size.x - 50, gameRef.size.y / 2), righttactionbutton, "");
      add(_btnright);
      add(_btnleft);
    }

  }
}