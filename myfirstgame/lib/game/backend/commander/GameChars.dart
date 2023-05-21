

import 'package:myfirstgame/game/backend/commander/EnumGameCommanders.dart';
import 'package:myfirstgame/game/backend/commander/GameCommander.dart';


class GameChars

{

  List<GameCommander> commanders = [];

  void getOfflineChars()
  {
   commanders.add(GameCommander(EnumGameCommanders.CommanderOne, true));
   commanders.add(GameCommander(EnumGameCommanders.CommanderTwo, false));
   commanders.add(GameCommander(EnumGameCommanders.CommanderThree, false));
   commanders.add(GameCommander(EnumGameCommanders.CommanderFour, false));
   commanders.add(GameCommander(EnumGameCommanders.CommandressOne, false));
   commanders.add(GameCommander(EnumGameCommanders.CommandressTwo, false));
  }


  void getOnlineChars()
  {




  }


}

