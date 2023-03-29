


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/GameTimer.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../player/Player.dart';
import '../background/Background.dart';
import '../background/EnumGlobalsBackgroundElements.dart';
import 'enums/EnumGameState.dart';

class GameAutoBattle extends PositionComponent with HasGameRef<MySpaceGame>

{
  int _round = 0;
  bool _isactivestate = false;
  bool _isgameloaded = false;
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
      //_isgameloaded = true;
    }else{

    }



  }

  @override
  void update(double dt) {
    super.update(dt);


    if(!_isgameloaded){

    }else {
      switch (_gameState) {
        case EnumGameState.BEGINPHASE:
          print("Phase: Begin");
          if (checkWon()) {

          }
          else {
            _round ++;
            _gameState = EnumGameState.BUYPHASE;
          }

          break;
        case EnumGameState.BUYPHASE:
          print("Phase: Buy");
          if (!_isactivestate) {
            _isactivestate = true;
          } else {
            if (_timer.timer.finished) {
              _gameState = EnumGameState.FIGHTPHASE;
              _isactivestate = false;
              break;
            } else {
              _timer = GameTimer(Vector2(size[0] / 2, 20),
                  period: _gameState.timeforphase.toDouble());
            }
          }
          break;
        case EnumGameState.FIGHTPHASE:
          print("Phase: Fight");
          if (!_isactivestate) {
            _isactivestate = true;
          } else {
            if (_timer.timer.finished) {
              _isactivestate = false;
              break;
            } else {
              _timer = GameTimer(Vector2(size[0] / 2, 20),
                  period: _gameState.timeforphase.toDouble());
            }
          }
          break;
        case EnumGameState.ENDPHASE:
          print("Phase: End");
          if (!_isactivestate) {
            _isactivestate = true;
          } else {
            if (_timer.timer.finished) {
              _isactivestate = false;
              break;
            } else {
              _timer = GameTimer(Vector2(size[0] / 2, 20),
                  period: _gameState.timeforphase.toDouble());
            }
          }
          break;
        case EnumGameState.ENDGAME:
          print("Phase: EndGame");
          if (!_isactivestate) {
            _isactivestate = true;
            if (identical(_winner, "BOT")) {
              // remove all Components -> MySpaceGame.losingscreen
            }
          } else {

          }

          break;
      }
    }
  }



  void fighting()
  {
    /*
    if(team1.isEmpty || team2.isEmpty){
      if(team2.isNotEmpty){
        team2.forEach((BasicShip ship) { ship.fighting(false);  ship.removeFromParent();});
        _fight = false; _hpPlayer1-=1;timer.timer.start();
      }
      if(team1.isNotEmpty){
        team1.forEach((BasicShip ship) { ship.fighting(false); ship.removeFromParent();});
        _fight = false; _hpPlayer2-=1;timer.timer.start();
      }
    }
*/
  }

  void beginnfight()
  {
    /*
    team1.forEach((BasicShip ship) { ship.fighting(true);});
    team2.forEach((BasicShip ship) { ship.fighting(true);});
    _fight = true;
    */


  }


  void loadShips()
  {
/*
    if(!_fight){
      base = BasicShip(0, 'ships/normal/other/AlienShip1.png', 200, 10, 50, 50, 200, 0, 1);
      base1 = BasicShip(0, 'ships/normal/other/AlienShip1.png', 200, 400, 100, 100, 800, 200, 2);
      base2 = BasicShip(1, 'ships/normal/other/AlienShip1.png', 50, 400, 100, 100, 100, 100, 2);
      base4 = BasicShip(1, 'ships/normal/other/AlienShip1.png', 50, 10, 50, 50, 200, 00, 1);
      team1.add(base);
      team1.add(base4);
      team2.add(base1);
      team2.add(base2);

      add(base);
      add(base1);
      add(base2);
      add(base4);
      beginnfight();
    }
*/
  }



  bool initSzene()

  {

    try{
      _background = Background();
      add(_background);
      _background.setSizes(gameRef.size[0].toInt(), gameRef.size[1].toInt());
      _background.addingAnimatedBackgroundElement
        (EnumGlobalsBackgroundElements.AnimatedElementBlackHole1);
      _background.addingAnimatedBackgroundElement
        (EnumGlobalsBackgroundElements.AnimatedElementBlackHole1);
      _timer = GameTimer(Vector2(gameRef.size[0] / 2, 20), period: 0);
      add(_timer);
      _gameState = EnumGameState.BEGINPHASE;
      _isactivestate = false;

    return true;
    }catch(exeption){
      print("Fehler beim Laden: " + exeption.toString());
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

  Player get player2 => _player2;

  set player2(Player value) {
    _player2 = value;
  }

  Player get player1 => _player1;

  set player1(Player value) {
    _player1 = value;
  }
}