



import '../ships/BasicShip.dart';
import 'EnumPlayerImages.dart';

class Player
{

  late String nickname;
  late int _hp;
  late EnumPlayerImages _image;
  List<BasicShip> _team = [];
  late List<BasicShip> _tempsaveteam = [];
  late int _currentcredits = 0;

  void addAllToTeam() {
    team.addAll(tempsaveteam);
  }
  void addAllToTempList() {
    tempsaveteam.addAll(team);
  }

    Player(this.nickname, this._hp, this._image);

  void lostround(){
    _hp--;
  }

  List<BasicShip> get team => _team;

  set team(List<BasicShip> value) {
    _team = value;
  }

  EnumPlayerImages get image => _image;

  set image(EnumPlayerImages value) {
    _image = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  int get currentcredits => _currentcredits;

  set currentcredits(int value) {
    _currentcredits = value;
  }

  List<BasicShip> get tempsaveteam => _tempsaveteam;

  set tempsaveteam(List<BasicShip> value) {
    _tempsaveteam = value;
  }
}