



import '../../game/backend/commander/EnumGameCommanders.dart';
import '../ships/basic/BasicShip.dart';

class Player
{

  late String nickname;
  late int _hp;
  List<BasicShip> _team = List.from([], growable: true);
  late int _currentcredits = 0;
  late EnumGameCommanders commander;


    Player(this.nickname, this._hp, this.commander);

  void lostround(){
    _hp--;
  }

  List<BasicShip> get team => _team;

  set team(List<BasicShip> value) {
    _team = value;
  }



  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  int get currentcredits => _currentcredits;

  set currentcredits(int value) {
    _currentcredits = value;
  }


}