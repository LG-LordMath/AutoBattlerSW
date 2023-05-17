



import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:myfirstgame/engine/nations/EnumNation.dart';
import 'package:myfirstgame/engine/player/ai/PlayerAi.dart';
import 'package:myfirstgame/engine/ships/basic/LoaderShips.dart';
import 'package:myfirstgame/engine/ships/republicships/EnumRepublicShips.dart';
import 'package:myfirstgame/engine/ships/republicships/RepublicShipsLoader.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/EnumCISShips.dart';
import 'package:myfirstgame/engine/ships/seperatistencis/SeperatistCISShipLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameBottomBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameUpperBar.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gamemap/GamePlayFieldMap.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/GameTimer.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/GameSellUI.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/GameShopMenue.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/game/gameshop/ShopLogic.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../player/Player.dart';
import '../../ships/basic/BasicShip.dart';
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
  late GameSellUI gameSellUI;


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
          if(_isactivestate)
          {
              checkifshipscanlevelup(player1.team);

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

         //   add(_timer);
          }
          if(_isactivestate){


            if(checkFightending()){
              _isactivestate = false;
              endFight();
              gameState = EnumGameState.ENDPHASE;
            }else {
              map.setVisibale(false);
              ennemymap.setVisibale(false);
            }
          }

          break;
        case EnumGameState.ENDPHASE:
        //  print("Phase: End");
          if(!_isactivestate){
            map.setVisibale(true);
            ennemymap.setVisibale(true);
            _isactivestate = true;
            _timer.destroy();
            _timer = GameTimer(Vector2(gameRef.size[0] / 2.2, 20),  0);
            add(_timer);

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
          if (!_isactivestate)
          {
            if(gameSellUI.isLoaded)
            {
              gameSellUI.destroy();
            }
            bottomBar.destroy();
            player1.team.forEach((element) {
              element.removeFromParent();
            });
            player2.team.forEach((element) {
              element.removeFromParent();
            });
            if(shopMenue.isMounted){
              openOrcloseShop();
            }
            upperBar.destroy();
            map.removeFromParent();
            ennemymap.removeFromParent();
            if (identical(_winner, "BOT"))
            {
              gameRef.setlosescreeen();
            } else {
              gameRef.setwinningscreen();
            }
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

    _player1team.forEach((element)
    {
      BasicShip tempbasicShip;
      print("add ship to main field: " + element.mainfieldis.toString());
      if (element.nation == EnumNation.Imperium)
      {
        for (int i = 0; i < GalaticEmpireShipsLoader.empireships.length; i++)
        {
          if (GalaticEmpireShipsLoader.empireships.values.elementAt(i).runtimeType == element.runtimeType)
          {
            GalaticEmpireShipsLoader rep = GalaticEmpireShipsLoader();
            rep.reloadObject(EnumGalaticEmpireShips.values.elementAt(i));
            tempbasicShip =GalaticEmpireShipsLoader.empireships[EnumGalaticEmpireShips.values.elementAt(i)]!;
            tempbasicShip.currentteam = 1;
            tempbasicShip.level = element.level;
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
            tempbasicShip.level = element.level;
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
            tempbasicShip.level = element.level;
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
            tempbasicShip.level = element.level;
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
            tempbasicShip.level = element.level;
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
            tempbasicShip.level = element.level;
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

  void checkifshipscanlevelup(List<BasicShip> team) {
    List<BasicShip> sameship = [];
    // Iteriere über jedes Schiff im "team" Array
    for (BasicShip ship in team) {
      // Iteriere erneut über jedes Schiff im "team" Array, außer dem aktuell ausgewählten Schiff
      for (BasicShip otherShip in team.where((s) => s != ship)) {
        // Überprüfe, ob die Klasse der Schiffe übereinstimmt
        if (ship.runtimeType == otherShip.runtimeType) {
          // Wenn ja, füge das Schiff zur Liste "sameship" hinzu, falls es noch nicht in der Liste ist
          if (!sameship.contains(ship) ) {
            sameship.add(ship);
          }
          if (!sameship.contains(otherShip)&& ship.level == otherShip.level) {
            sameship.add(otherShip);
          }
        }
      }
    }
/*
    for (BasicShip ship in bottomBar.tempships) {
      // Iteriere erneut über jedes Schiff im "team" Array, außer dem aktuell ausgewählten Schiff
      for (BasicShip otherShip in bottomBar.tempships.where((s) => s != ship)) {
        // Überprüfe, ob die Klasse der Schiffe übereinstimmt
        if (ship.runtimeType == otherShip.runtimeType) {
          // Wenn ja, füge das Schiff zur Liste "sameship" hinzu, falls es noch nicht in der Liste ist
          if (!sameship.contains(ship)) {
            sameship.add(ship);
          }
          if (!sameship.contains(otherShip)&& ship.level == otherShip.level) {
            sameship.add(otherShip);
          }
        }
      }
    }

 */

   // print(sameship);

    // Gib die Liste der Schiffe mit der gleichen Klasse aus
    if(sameship.length >= 3)
    {

      List<BasicShip> tempsameship = [];
      sameship.forEach((ship) {
       // List<BasicShip> sameTypeShips = sameship.where((s) => s.runtimeType == ship.runtimeType).toList();

        List<BasicShip> sameTypeShips = sameship
            .where((s) => s.runtimeType == ship.runtimeType && s.runtimeType == ship.runtimeType && s.level == ship.level)
            .toList();
        if (sameTypeShips.length >= 3) {
          tempsameship.addAll(sameTypeShips.sublist(0, 3));
        }
      });
    //  print(tempsameship);
      if(tempsameship.length > 0){

        BasicShip? tempship = LoaderShips.getNewShip(tempsameship[0]);
        if(tempship!=null)
        {
          tempship.level = tempsameship[0].level;
          tempship.level ++;
          tempship.currentteam = 1;
          tempship.cellfields = tempsameship[0].cellfields;
          tempship.mainfieldis = tempsameship[0].mainfieldis;
          for(int i = 0; i < 3; i++)
          {
            team.remove(tempsameship[i]);
            if(tempsameship[i].cellfields.isNotEmpty) {
              map.maincells[tempsameship[i].mainfieldis].releaseCellsAndMap(tempsameship[i].cellfields, tempsameship[i]);
              tempsameship[i].removeFromParent();
            }
          }
          add(tempship);
            tempship.scale = Vector2(tempship.shipclass.CellsizeX.toDouble(), tempship.shipclass.CellsizeY.toDouble());
            map.maincells[tempship.mainfieldis].addShip(tempship);

        }


      }


    }
  }


  void sellShip(BasicShip basicShip)
  {
    gameSellUI = GameSellUI(basicShip);
    if(gameSellUI.isMounted)
    {
      gameSellUI.destroy();
      gameSellUI = GameSellUI(basicShip);
      add(gameSellUI);
    }
    else
    {
      add(gameSellUI);
    }
  }
}