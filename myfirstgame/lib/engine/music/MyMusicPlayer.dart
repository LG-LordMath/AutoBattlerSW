



import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:myfirstgame/engine/music/EnumMusic.dart';

import '../../game/backend/Option.dart';

class MyMusicPlayer


{

  @override
  Future<void> load() async {
    FlameAudio.bgm.initialize();
    print("Beginne mit dem Laden der AudioDatein");
    try{
      await FlameAudio.audioCache.loadAsFile(EnumMusic.StarWarsTheCloneWarsIntro.musicfilepath.toString());
      await FlameAudio.audioCache.loadAsFile(EnumMusic.LaserOne.musicfilepath.toString());


    }catch(exeption){
      print(exeption);
    }
   // await FlameAudio.audioCache.load(EnumMusic.StarWarsTheCloneWarsTheme.musicfilepath);
    print("Ende mit dem Laden der AudioDatein");

  }






  static void play(EnumMusic music)
  {
      FlameAudio.play(music.musicfilepath, volume: Option.soundvolume.toDouble());

  }

  static void playlong(EnumMusic music) {

      FlameAudio.playLongAudio(music.musicfilepath, volume:  Option.musicvolume.toDouble());

  }
  static void playBackgroundMusic()
  {

  }


  static void stopplaying()
  {
   if(FlameAudio.bgm.isPlaying){
     FlameAudio.bgm.dispose();
   }

  }
}