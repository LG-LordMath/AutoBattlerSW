



import 'EnumPlayerImages.dart';

class Player
{


  late int _hp;
  late EnumPlayerImages image;


  Player(this._hp, this.image);

  void lostround(){
    _hp--;
  }

}