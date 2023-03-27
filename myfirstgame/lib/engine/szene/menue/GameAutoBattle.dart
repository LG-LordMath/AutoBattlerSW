


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/GameTimer.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../player/Player.dart';
import '../background/Background.dart';
import 'enums/EnumGameState.dart';

class GameAutoBattle extends PositionComponent with HasGameRef<MySpaceGame>

{
  int _round = 0;
  bool _isactivestate = false;
  late Player _player1;
  late Player _player2;
  late GameTimer _timer;
  late Background _background;
  late EnumGameState _gameState;
  late String _winner;

  GameAutoBattle(this._player1, this._player2);


  @override
  Future<void> onLoad() async

  {
    position = Vector2(0, 0);
    if(initSzene())
    {

    }else{

    }



  }

  @override
  void update(double dt) {
    super.update(dt);
    switch(_gameState){
      case EnumGameState.BEGINPHASE:
        if(checkWon())
        {

        }
        else
        {
          _round ++;
          _gameState = EnumGameState.BUYPHASE;
        }

        break;
      case EnumGameState.BUYPHASE:
        print("Phase: Buy");
        if(!_isactivestate){
          _isactivestate = true;
        }else{
          if(_timer.timer.finished){
            _gameState = EnumGameState.FIGHTPHASE;
            _isactivestate = false;
            break;
          }else{
            _timer = GameTimer(Vector2(size[0] / 2, 20) ,period: _gameState.timeforphase.toDouble());
          }
        }
        break;
      case EnumGameState.FIGHTPHASE:
        print("Phase: Fight");
        if(!_isactivestate){
          _isactivestate = true;


        }else{
          if(_timer.timer.finished){
            _isactivestate = false;
            break;
          }else{
            _timer = GameTimer(Vector2(size[0] / 2, 20) ,period: _gameState.timeforphase.toDouble());
          }
        }
        break;
      case EnumGameState.ENDPHASE:
        print("Phase: End");
        if(!_isactivestate){
          _isactivestate = true;


        }else{
          if(_timer.timer.finished){
            _isactivestate = false;
            break;
          }else{
            _timer = GameTimer(Vector2(size[0] / 2, 20) ,period: _gameState.timeforphase.toDouble());
          }
        }
        break;
      case EnumGameState.ENDGAME:
        print("Phase: EndGame");
        if(!_isactivestate){
          _isactivestate = true;
          if(identical(_winner, "BOT")){
            // remove all Components -> MySpaceGame.losingscreen
          }
        }else{

        }

        break;
    }
  }





  bool initSzene()

  {

    try{
      _background = Background();
      add(_background);
      _timer = GameTimer(Vector2(gameRef.size[0] / 2, 20), period: 0);
      add(_timer);
      _gameState = EnumGameState.BEGINPHASE;
      _isactivestate = false;

    return true;
    }catch(exeption){
      print(exeption);
    }
    return false;

  }

  void destroySzene()
  {

  }


  bool checkWon()
  {
    if(_player1.hp <= 0 || _player2.hp <= 0){
      if(_player1.hp <= 0){
        _winner = _player2.nickname;
        _gameState = EnumGameState.ENDGAME;
      }
      if(_player2.hp <= 0){
        _winner = _player1.nickname;
          _gameState = EnumGameState.ENDGAME;
      }
      return true;
    }
    return false;
  }





}