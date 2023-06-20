

import 'package:myfirstgame/game/backend/commander/EnumGameCommanders.dart';
import 'package:myfirstgame/game/backend/commander/GameCommander.dart';


class GameChars

{

  List<GameCommander> commanders = [];

  void getOfflineChars()
  {
   commanders.add(GameCommander(EnumGameCommanders.CommanderOne, true));
   commanders.add(GameCommander(EnumGameCommanders.CommanderTwo, true));
   commanders.add(GameCommander(EnumGameCommanders.CommanderThree, true));
   commanders.add(GameCommander(EnumGameCommanders.CommanderFour, true));
   commanders.add(GameCommander(EnumGameCommanders.CommandressOne, true));
   commanders.add(GameCommander(EnumGameCommanders.CommandressTwo, true));
  }


  void getOnlineChars()
  {




  }


}

