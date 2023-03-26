



import '../ships/BasicShip.dart';
import 'EnumPlayerImages.dart';

class Player
{


  late int _hp;
  late EnumPlayerImages _image;
  List<BasicShip> _team = [];


  Player(this._hp, this._image);

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
}