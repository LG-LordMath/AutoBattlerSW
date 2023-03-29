


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import 'Button.dart';

class MyGameChoise extends PositionComponent with HasGameRef<MySpaceGame>


{

  late Vector2 _size;
  late Vector2 _position;
  late Button btnGameBot;
  late Button btnGameOnline;

  MyGameChoise(this._position, this._size);


  @override
  Future<void> onLoad() async

  {
    parent = gameRef;
    position = _position;
    size = _size;
    Sprite? sp = ImageLoader.sprites[EnumImages.UIButtonOne];
    btnGameBot = Button(sp!,
        gameRef.size[0] - 50, gameRef.size[1] / 9.5,
        Vector2(30, 100), gamestartBot,
        "Player VS Bot");

    add(btnGameBot);
    btnGameOnline = Button(sp!,
        gameRef.size[0] - 50, gameRef.size[1] / 9.5,
        Vector2(30, 200), gamestartBot,
        "PvP (nicht verfügbar)");

    add(btnGameOnline);



  }

  void destroy()
  {
    btnGameBot.destroy();
    btnGameOnline.destroy();
    removeFromParent();
  }




  void gamestartBot()
  {

  }
  void gamestartPlayer()
  {

  }


}