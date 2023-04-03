


import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:myfirstgame/engine/bullets/LaserBullet.dart';
import 'package:myfirstgame/engine/bullets/NormalBullet.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';
import 'package:myfirstgame/engine/music/MyMusicPlayer.dart';


//Jäger
class LaserCannons extends PositionComponent
{

  int _maxammonition = 1;
  int _maxreloadtime  = 80;
  int _currentreloadtime  = 0;
  int _currentamonition = 1;

  late Vector2 _currentshipposition;
  late Vector2 _currentshipsize;
  late int _damage;
  late int _lifetime;
  late int _team;
  late Vector2 _positionEnemy;


  bool _isfiring = false;



  LaserCannons(this._currentshipposition, this._damage, this._lifetime,
      this._team, this._currentshipsize);


  @override
  Future<void> onLoad() async {
      position = Vector2((_currentshipsize.x / 2) ,  (_currentshipsize.y / 2));
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    if(_isfiring){
      if(_currentamonition == 0 ){
        _currentreloadtime--;
      }
      if(_currentreloadtime == 0){
        _currentamonition = _maxammonition;
        _currentreloadtime = _maxreloadtime;
      }
      if(_currentamonition > 0 ){
        //print("Ship position: " + position.toString());
        if (_positionEnemy.x != 0 && _positionEnemy.y != 0) {
          //print("fire");
          LaserBullet laser = LaserBullet(ImageLoader.sprites[EnumImages.LaserOne]!, 10, 30, _positionEnemy ,  _currentshipposition + position, _damage, _lifetime, _team);
          laser.playSound(EnumMusic.LaserOne);

          add(laser);
          _currentamonition--;

        }

      }
    }


  }


  void fire(bool pfire, Vector2 enemy){
    _isfiring = pfire;
    _positionEnemy = enemy;
  }

  void stopfireing()
  {
    _isfiring = false;
  }

}