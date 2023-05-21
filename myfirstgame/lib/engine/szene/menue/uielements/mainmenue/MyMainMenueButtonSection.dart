


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/basics/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MyGameChoise.dart';

class MyMainMenueButtonSection extends SpriteComponent with HasGameRef<MySpaceGame> {

  Vector2 positions;
  late Button btnPlay;
  late Button btnArchivements;
  late Button btnarmee;
  late Button btndiscord;
  late SpriteComponent spdiscord;

  //boolean
  late bool _isGamechoiseopen = false;
  late bool _isDiscordopen = false;
  late bool _isArchivementsopen = false;
  late bool _isArmeeopen = false;

  late bool optionelementisopen = false;


  late MyGameChoise _gameChoise;

  MyMainMenueButtonSection(this.positions);


  @override
  Future<void> onLoad() async

  {
    position = Vector2(positions.x, positions.y);
    sprite = ImageLoader.sprites[EnumImages.UICardThree];
    size = Vector2(gameRef.size[0], gameRef.size[1] / 3);
    _gameChoise = MyGameChoise(Vector2(0, 50), Vector2(gameRef.size[0], gameRef.size[1] / 3));

    Sprite? sp = ImageLoader.sprites[EnumImages.UIButtonOne];
    btnPlay = Button(sp!,
        gameRef.size[0] - 50, gameRef.size[1] / 9.5,
        Vector2(30, gameRef.size[1] - gameRef.size[1] / 4.2), playbuttonaction,
        "Play");
    add(btnPlay);
    btnPlay.setTextPosition(Vector2(gameRef.size[0] - gameRef.size[0] / 1.8,
        gameRef.size[1] - gameRef.size[1] / 5));
    Sprite? spone = ImageLoader.sprites[EnumImages.UIIconCellTwo];
    btnArchivements = Button(spone!,
        70, 70, Vector2(30, gameRef.size[1] - gameRef.size[1] / 7.5),
        archivementsbuttonaction, "E");
    add(btnArchivements);
    btnArchivements.setTextPosition(
        Vector2(55, gameRef.size[1] - gameRef.size[1] / 9));
    btnarmee = Button(spone,
        70, 70,
        Vector2(gameRef.size[0] - 100, gameRef.size[1] - gameRef.size[1] / 7.5),
        armeebuttonaction, "A");
    add(btnarmee);
    btnarmee.setTextPosition(
        Vector2(gameRef.size[0] - 75, gameRef.size[1] - gameRef.size[1] / 9));
    btndiscord = Button(sp,
        gameRef.size[0] / 2.5, 70, Vector2(110, gameRef.size[1] - gameRef.size[1] / 7.5),
        discordbuttonaction, "");

    btndiscord.addImage(spdiscord =
        SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UIDiscord]!,
            position: Vector2(gameRef.size[0] / 2.2 / 3.2, 10),
            size: Vector2(50, 50))
    );
    add(btndiscord);
  }


  void resetplaybuttonaction()
  {
    if(_gameChoise.isMounted){
      _gameChoise.destroy();
    }

    btnPlay.setText("Play");
    _isGamechoiseopen = false;

  }




  void playbuttonaction()

  {

    if(!_isGamechoiseopen)
    {
      gameRef.mainMenue.myHeaderMainMenue.destroyOption();
      _gameChoise = MyGameChoise(Vector2(0, 50), Vector2(gameRef.size[0], gameRef.size[1] / 3));
      add(_gameChoise);
      btnPlay.setText("Cancel");
      _isGamechoiseopen = true;
    }else{
      gameRef.mainMenue.charSelection.enableearrows();
      _gameChoise.destroy();
      btnPlay.setText("Play");
      _isGamechoiseopen = false;
    }

  }

  void archivementsbuttonaction()
  {

  }

  void armeebuttonaction()
  {

  }


  Future<void> discordbuttonaction() async {
    final Uri url = Uri.parse('https://discord.gg/k5zpHDuSJs');
    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
    }
  }

  void destroy()
  {
    btnPlay.destroy();
    btnArchivements.destroy();
    btnarmee.destroy();
    btndiscord.destroy();
    removeFromParent();
  }


}