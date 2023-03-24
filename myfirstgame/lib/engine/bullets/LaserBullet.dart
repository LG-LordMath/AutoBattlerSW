


import 'package:flame_audio/flame_audio.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';

class LaserBullet extends IBasicBullet{


  bool _isplayingmusic = false;

  LaserBullet(super.imagepath, super.imagesizex, super.imagesizey, super.enemy, super.currentship, super.damage, super.lifetime, super.team);



  void playSound(String soundfilepath)
  {
    if(!_isplayingmusic)
    {

      FlameAudio.play(soundfilepath).timeout(Duration(seconds: 2));

      _isplayingmusic = true;

    }

  }




}