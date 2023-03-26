


import 'package:flame_audio/flame_audio.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';
import 'package:myfirstgame/engine/music/MyMusicPlayer.dart';

class LaserBullet extends IBasicBullet{


  bool _isplayingmusic = false;

  LaserBullet(super.imagepath, super.imagesizex, super.imagesizey, super.enemy, super.currentship, super.damage, super.lifetime, super.team);



  void playSound(EnumMusic sound)
  {
    if(!_isplayingmusic)
    {

        MyMusicPlayer.play(sound);

      _isplayingmusic = true;

    }

  }




}