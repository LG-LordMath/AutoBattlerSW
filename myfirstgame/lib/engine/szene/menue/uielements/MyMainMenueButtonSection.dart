


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class MyMainMenueButtonSection extends SpriteComponent with HasGameRef<MySpaceGame> {

  Vector2 positions;
  late Button btnPlay;
  late Button btnArchivements;
  late Button btnarmee;
  late Button btndiscord;
  late SpriteComponent spdiscord;

  MyMainMenueButtonSection(this.positions);


  @override
  Future<void> onLoad() async

  {
    position = Vector2(positions.x, positions.y);
    sprite = ImageLoader.sprites[EnumImages.UICardThree];
    size = Vector2(gameRef.size[0], gameRef.size[1] / 3);
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

    btnarmee = Button(spone!,
        70, 70,
        Vector2(gameRef.size[0] - 100, gameRef.size[1] - gameRef.size[1] / 7.5),
        armeebuttonaction, "A");

    add(btnarmee);

    btnarmee.setTextPosition(
        Vector2(gameRef.size[0] - 75, gameRef.size[1] - gameRef.size[1] / 9));


    Sprite? sptwo = ImageLoader.sprites[EnumImages.UIDiscord];

    btndiscord = Button(sp!,
        170, 70, Vector2(110, gameRef.size[1] - gameRef.size[1] / 7.5),
        discordbuttonaction, "");

    btndiscord.addImage(spdiscord =
        SpriteComponent(sprite: ImageLoader.sprites[EnumImages.UIDiscord]!,
            position: Vector2(55, 10),
            size: Vector2(50, 50))
    );
    add(btndiscord);
  }


  void playbuttonaction() {
    print("clicked");
  }

  void archivementsbuttonaction() {

  }

  void armeebuttonaction() {

  }
  void discordbuttonaction(){

  }



}