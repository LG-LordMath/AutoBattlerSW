



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameBottomBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameUpperBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gamemap/GamePlayFieldMap.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/GameShopMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/ShopLogic.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../player/Player.dart';
import '../../ships/BasicShip.dart';
import '../background/Background.dart';
import '../background/EnumGlobalsBackgroundElements.dart';
import 'enums/EnumGameState.dart';

class GameAutoBattle extends PositionComponent with HasGameRef<MySpaceGame>
{
  int _round = 0;
  bool _isactivestate = false;
  bool _isgameloaded = false;
  bool isShopopen = false;
  late Player _player1;
  late Player _player2;


  late GameShopMenue shopMenue;
  late GameBottomBar bottomBar;
  late GameTimer _timer;
  late Background _background;
  late EnumGameState _gameState;
  late String _winner;
  late List<BasicShip> tempshipsshop;
  late List<bool> tempshipshopbuyed =  List.from([true, true, true], growable:  false);
  late ShopLogic shopLogic;

  late GamePlayFieldMap map = GamePlayFieldMap(30, gameRef.size[1]/ 2.1);
  late GamePlayFieldMap ennemymap = GamePlayFieldMap(30, 100);
  GameUpperBar upperBar = GameUpperBar();


  GameAutoBattle(this._player1, this._player2);

  @override
  Future<void> onLoad() async

  {


    position = Vector2(0, 0);
    if(initSzene())
    {

      _isgameloaded = true;
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
          if (checkWon())
          {

          }
          else
          {
            _round ++;
            _isactivestate = false;
            _gameState = EnumGameState.BUYPHASE;
          }

          break;
        case EnumGameState.BUYPHASE:
         // print("Phase: Buy");
          if(!_isactivestate){
            _isactivestate = true;
            _timer.destroy();
            _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  10);

            if(!isShopopen){
              gameRef.gameAutoBattle.tempshipshopbuyed[0] = true;
              gameRef.gameAutoBattle.tempshipshopbuyed[1] = true;
              gameRef.gameAutoBattle.tempshipshopbuyed[2] = true;
              tempshipsshop = List.from([shopLogic.getRandomShip(),
                shopLogic.getRandomShip(),
                shopLogic.getRandomShip()]);
              shopMenue=  GameShopMenue();
              add(shopMenue);


              isShopopen = true;
            }


            add(_timer);
          }
          if(_isactivestate){
              if(_timer.timer.current > 9){
                if(isShopopen){
                  shopMenue.destroy();
                  isShopopen = false;
                }
                _isactivestate = false;
                _gameState = EnumGameState.FIGHTPHASE;
              }
          }

          break;
        case EnumGameState.FIGHTPHASE:
         // print("Phase: Fight");
          if(!_isactivestate)
          {
            _isactivestate = true;
        //    _timer.destroy();
           // _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  5);
            beginnFight();
         //   add(_timer);

          }
          if(_isactivestate){
            if(checkFightending()){
              _isactivestate = false;
              endFight();
              _gameState = EnumGameState.ENDPHASE;
            }
          }

          break;
        case EnumGameState.ENDPHASE:
        //  print("Phase: End");
          if(!_isactivestate){
            _isactivestate = true;
            _timer.destroy();
            _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  0);
            add(_timer);
            player1.currentcredits += 6;
            player2.currentcredits += 6;
          }
          if(_isactivestate){
            if(_timer.timer.finished){
              _isactivestate = false;
              _gameState = EnumGameState.BEGINPHASE;
            }
          }

          break;
        case EnumGameState.ENDGAME:
          print("Phase: EndGame");
          if (!_isactivestate) {
            _isactivestate = true;
            if (identical(_winner, "BOT"))
            {
              // remove all Components -> MySpaceGame.losingscreen
            }
          } else {

          }
          break;
      }
    }
  }

  bool checkFightending()
  {
    bool playertwowon = true;
    bool playeronewon = true;

   if(player1.team.isNotEmpty)
   {

     player1.team.forEach((element) {
       if(element.hp > 0 && playertwowon){
         playertwowon = false;
       }
     });
   }

   if(player2.team.isNotEmpty)
   {

      player2.team.forEach((element) {
        if(element.hp > 0 && playeronewon){
          playeronewon = false;
        }
      });
   }

   if(playeronewon){
     player2.hp--;
     return true;
   }
    if(playertwowon){
      player1.hp--;
      return true;
    }



    return false;
  }



  void beginnFight()
  {
    player1.team.forEach((BasicShip ship) {ship.fighting(true);});
    player2.team.forEach((BasicShip ship) {ship.fighting(true);});
  }

  void endFight() {
    player1.team.forEach((BasicShip ship) {
      ship.fighting(false);
      for (int i = 0; i < map.maincells.length; i++) {
        if(ship.mainfieldis==i)
        {
         map.maincells[i].cells[ship.cellfields.first].setShipPosition(ship);
        }
      }

    });
    player2.team.forEach((BasicShip ship) {
      ship.fighting(false);
      for (int i = 0; i < map.maincells.length; i++) {
        if(ship.mainfieldis==i)
        {
          ennemymap.maincells[i].cells[ship.cellfields.first].setShipPosition(ship);
        }
      }
    });

  }



  void openOrcloseShop(){

    if(isShopopen){
      shopMenue.destroy();
      isShopopen = false;
    }else{
      shopMenue = GameShopMenue();
      add(shopMenue);
      isShopopen = true;
    }

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
      _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  1);

      _gameState = EnumGameState.BEGINPHASE;
      _isactivestate = false;
      bottomBar = GameBottomBar();
      shopLogic = ShopLogic();
      add(shopLogic);




      add(_timer);
      add(bottomBar);

      add(map);
      add(ennemymap);
      add(upperBar);
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
    print("Nicht Gewonnen");
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