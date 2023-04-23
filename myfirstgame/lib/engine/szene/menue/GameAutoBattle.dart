



import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/player/ai/PlayerAi.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/ships/republicships/RepublicShipsLoader.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SeperatistCISShipLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameBottomBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameUpperBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gamemap/GamePlayFieldMap.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/GameShopMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/ShopLogic.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:myfirstgame/main.dart';

import '../../bullets/BulletListLoader.dart';
import '../../player/Player.dart';
import '../../ships/BasicShip.dart';
import '../../ships/galacticempireships/EnumGalaticEmpireShips.dart';
import '../../ships/galacticempireships/GalacticEmpireShipsLoader.dart';
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

  List<BasicShip> _player1team = [];
  List<BasicShip> _player2team = [];

  late GameShopMenue shopMenue;
  late GameBottomBar bottomBar;
  late GameTimer _timer;
  late Background _background;
  late EnumGameState gameState;
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

    //print("State: " +gameState.name.toString());
    if(!_isgameloaded){

    }else {
      switch (gameState) {
        case EnumGameState.BEGINPHASE:

          print("Phase: Begin");
          if (checkWon())
          {

          }
          else
          {
            _player1team = [];
            _player2team = [];
            _round ++;
            _isactivestate = false;
            gameState = EnumGameState.BUYPHASE;
          }

          break;
        case EnumGameState.BUYPHASE:
         // print("Phase: Buy");
          if(!_isactivestate){
            _isactivestate = true;
            map.setVisibale(true);
            ennemymap.setVisibale(true);
            _timer.destroy();
            _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  10);




            if(player2 is PlayerAi)
            {

              PlayerAi   player =  player2 as PlayerAi;


              player.buyphase();
              _player2team.addAll(player2.team);



            }
            if(!isShopopen){
              gameRef.gameAutoBattle.tempshipshopbuyed[0] = true;
              gameRef.gameAutoBattle.tempshipshopbuyed[1] = true;
              gameRef.gameAutoBattle.tempshipshopbuyed[2] = true;
              tempshipsshop = List.from([shopLogic.getRandomShip(1),
                shopLogic.getRandomShip(1),
                shopLogic.getRandomShip(1)]);
              shopMenue=  GameShopMenue();
              add(shopMenue);


              isShopopen = true;
            }


            add(_timer);
          }
          if(_isactivestate){

              if(_timer.timer.current > 9)
              {

                if(isShopopen)
                {
                  shopMenue.destroy();
                  isShopopen = false;
                }


                _isactivestate = false;

                _player1team.addAll(player1.team);
                for(int i = 0; i < _player1team.length;i++){
                  _player1team[i].mainfieldis = player1.team[i].mainfieldis;
                  print("Set Mainfield: "+ _player1team[i].mainfieldis.toString() + ", from "+ player1.team[i].mainfieldis.toString());
                }
                gameState = EnumGameState.FIGHTPHASE;
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
            map.setVisibale(false);
            ennemymap.setVisibale(false);
         //   add(_timer);
          }
          if(_isactivestate){
            if(checkFightending()){
              _isactivestate = false;
              map.setVisibale(true);
              ennemymap.setVisibale(true);
              endFight();
              gameState = EnumGameState.ENDPHASE;
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
            map.setVisibale(true);
            ennemymap.setVisibale(true);
            player1.currentcredits += 6;
            player2.currentcredits += 6;
            if(player1.currentcredits > 99){
              player1.currentcredits = 99;
            }
            if(player2.currentcredits > 99){
              player2.currentcredits = 99;
            }

          }
          if(_isactivestate){
            if(_timer.timer.finished){
              _isactivestate = false;
              gameState = EnumGameState.BEGINPHASE;
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
  //  print("Check if won ");
    if(player1.team.isEmpty && player2.team.isEmpty){
      player1.hp--;
      player2.hp--;
      return true;
    }
    else if(player1.team.isEmpty && player2.team.isNotEmpty){
      player1.hp--;
      player2.team.forEach((element) {
        element.fighting(false);
        element.removeFromParent();
      });
      return true;
    } else if(player2.team.isEmpty && player1.team.isNotEmpty){
      player2.hp--;
      player1.team.forEach((element) {
        element.fighting(false);
        element.removeFromParent();
      });
      return true;
    }
    /*
    else
    {
      if(player1.team.isNotEmpty)
      {
        player1.team.forEach((element) {
          if(element.hp > 0 && playertwowon){
           // print("team 1: " + element.toString());;

            playertwowon = false;
          }
        });
      }

      if(player2.team.isNotEmpty)
      {

        player2.team.forEach((element) {
          if(element.hp > 0 && playeronewon){
           // print("team 2: " + element.toString());

            playeronewon = false;
          }
        });
      }

      if(playeronewon){
     //   print("player one won");
        player2.hp--;
        return true;
      }
      if(playertwowon){
        player1.hp--;
        return true;
      }
    }

     */
    return false;
  }



  void beginnFight()
  {
    player1.team.forEach((BasicShip ship) {ship.fighting(true);});
    player2.team.forEach((BasicShip ship) {ship.fighting(true);});
  }

  void endFight()
  {



    map.maincells.forEach((element) {
      element.clearShipsAndMap();
      //  print(element.getFreeCells());
    });
    ennemymap.maincells.forEach((element) {
      element.clearShipsAndMap();
      // print(element.getFreeCells());
    });
    player1.team = [];
    player2.team = [];
/*
    print("Team: ");
    player1.team.forEach((element)
    {
      print(element.toString() + ", team 1");
    });
    print("tempsave: ");
    _player1team.forEach((element)
    {
      print(element.toString() + ", team 1");
    });
    print("Team: ");
    player2.team.forEach((element)
    {
      print(element.toString() + ", team 2");
    });
    print("tempsave: ");
    _player2team.forEach((element)
    {
      print(element.toString() + ", team 2");
    });


 */
    _player1team.forEach((element)
    {
      BasicShip tempbasicShip;
      print("add ship to main field: " + element.mainfieldis.toString());
      if (element.nation == EnumNation.Imperium) {
        for (int i = 0; i < GalaticEmpireShipsLoader.empireships.length; i++)
        {
          if (GalaticEmpireShipsLoader.empireships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
            rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));
            tempbasicShip =GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 1;
            add(tempbasicShip);
            tempbasicShip.rotateImage();
            tempbasicShip.mainfieldis = element.mainfieldis;
            tempbasicShip.scale = Vector2(tempbasicShip.shipclass.CellsizeX.toDouble(), tempbasicShip.shipclass.CellsizeY.toDouble());
            map.maincells[element.mainfieldis].addShip(tempbasicShip);
            rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));

          }
        }
      }
      else if (element.nation == EnumNation.Republic) {
        for (int i = 0; i < RepublicShipsLoader.republicships .length; i++)
        {
          if (RepublicShipsLoader.republicships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            RepublicShipsLoader rep = RepublicShipsLoader();
            rep.reloadObject(EnumRepublicShips.values.elementAt(i));
            tempbasicShip =RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 1;
            add(tempbasicShip);
            tempbasicShip.rotateImage();
            tempbasicShip.mainfieldis = element.mainfieldis;
            tempbasicShip.scale = Vector2(tempbasicShip.shipclass.CellsizeX.toDouble(), tempbasicShip.shipclass.CellsizeY.toDouble());
            map.maincells[element.mainfieldis].addShip(tempbasicShip);
            rep.reloadObject(EnumRepublicShips.values.elementAt(i));

          }
        }
      }
      else if (element.nation == EnumNation.CIS) {

        for (int i = 0; i < SeperatistCISShipLoader.cisships.length; i++)
        {
          if (SeperatistCISShipLoader.cisships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            SeperatistCISShipLoader rep = SeperatistCISShipLoader();
            rep.reloadObject(EnumCISShips.values.elementAt(i));
            tempbasicShip =SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 1;
            add(tempbasicShip);
            tempbasicShip.rotateImage();
            tempbasicShip.mainfieldis = element.mainfieldis;
            tempbasicShip.scale = Vector2(tempbasicShip.shipclass.CellsizeX.toDouble(), tempbasicShip.shipclass.CellsizeY.toDouble());

            map.maincells[element.mainfieldis].addShip(tempbasicShip);
            rep.reloadObject(EnumCISShips.values.elementAt(i));

          }
        }
      }


    });


    //player Ai


    _player2team.forEach((element) 
    
    {
      BasicShip tempbasicShip;
      if (element.nation == EnumNation.Imperium) {
        for (int i = 0; i < GalaticEmpireShipsLoader.empireships.length; i++)
        {
          if (GalaticEmpireShipsLoader.empireships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
            rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));
            tempbasicShip =GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 2;
              //player2.team.add(tempbasicShip);
              gameRef.add(tempbasicShip);
              tempbasicShip.rotateImage();
              if(player2 is PlayerAi)
             {
              PlayerAi   player =  player2 as PlayerAi;
              player.placeShip(tempbasicShip);
             }
              rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));

          }
        }
      }
      else if (element.nation == EnumNation.Republic) {
        for (int i = 0; i < RepublicShipsLoader.republicships .length; i++)
        {
          if (RepublicShipsLoader.republicships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            RepublicShipsLoader rep = RepublicShipsLoader();
            rep.reloadObject(EnumRepublicShips.values.elementAt(i));
            tempbasicShip =RepublicShipsLoader.republicships[EnumRepublicShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 2;
            gameRef.add(tempbasicShip);
            tempbasicShip.rotateImage();
            if(player2 is PlayerAi)
            {
              PlayerAi   player =  player2 as PlayerAi;
              player.placeShip(tempbasicShip);
            }
            rep.reloadObject(EnumRepublicShips.values.elementAt(i));

          }
        }
      }
      else if (element.nation == EnumNation.CIS) {

        for (int i = 0; i < SeperatistCISShipLoader.cisships.length; i++)
        {
          if (SeperatistCISShipLoader.cisships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            SeperatistCISShipLoader rep = SeperatistCISShipLoader();
            rep.reloadObject(EnumCISShips.values.elementAt(i));
            tempbasicShip =SeperatistCISShipLoader.cisships[EnumCISShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 2;
            gameRef.add(tempbasicShip);
            tempbasicShip.rotateImage();
            if(player2 is PlayerAi)
            {
              PlayerAi   player =  player2 as PlayerAi;
              player.placeShip(tempbasicShip);
            }
            rep.reloadObject(EnumCISShips.values.elementAt(i));

          }
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

      gameState = EnumGameState.BEGINPHASE;
      _isactivestate = false;
      bottomBar = GameBottomBar();
      shopLogic = ShopLogic();
      add(shopLogic);




      add(_timer);
      add(bottomBar);

      add(map);
      final effect = RotateEffect.to(
        tau/2,
        EffectController(duration: 0), );
      add(ennemymap);
      ennemymap.add(effect);
      ennemymap.position = Vector2(30+ gameRef.size[0] / 1.2, 100 + gameRef.size[1]/ 3.0);
      add(upperBar);
      if(player2 is PlayerAi)
      {
        PlayerAi   player =  player2 as PlayerAi;
        player.game = gameRef;
      }
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
        gameState = EnumGameState.ENDGAME;
      }
      if(_player2.hp <= 0){
        _winner = _player1.nickname;
          gameState = EnumGameState.ENDGAME;
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