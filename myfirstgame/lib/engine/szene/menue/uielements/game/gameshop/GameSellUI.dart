

import 'dart:async';

import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/loader/ImageLoader.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class GameSellUI extends SpriteComponent with HasGameRef<MySpaceGame>
{

  late BasicShip shiptosell;
  late Button btnsell;
  late Button btnclose;

  GameSellUI(this.shiptosell);

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    parent = gameRef;
      sprite = ImageLoader.sprites[EnumImages.UICardOne];
      size = Vector2(gameRef.size[1] / 3.75, gameRef.size[1] / 6);
      position = Vector2(gameRef.size[0] / 3.75, gameRef.size[1] / 1.5);

      SpriteComponent component =
      SpriteComponent(sprite: shiptosell.spaceshipimage.sprite, size: Vector2(100, 100), position: Vector2(10, 10));
      add(component);

      btnsell = Button(ImageLoader.sprites[EnumImages.UIButtonOne]!, 70, 50,
          Vector2(gameRef.size[0] / 1.85, gameRef.size[1] / 1.35), sellShip, "sell");
      add(btnsell);
    btnclose = Button(ImageLoader.sprites[EnumImages.UIButtonOne]!, 70, 50,
        Vector2(gameRef.size[0] / 1.85, gameRef.size[1] / 1.47), destroy, "close");
    add(btnclose);


    }

  void destroy()
  {
    btnsell.destroy();
    btnclose.destroy();
    removeFromParent();
  }

  void sellShip()
  {
      int coinsback = shiptosell.creditcost;

      if(shiptosell.level == 2)
      {
       coinsback += 2;
      }else  if(shiptosell.level == 3)
      {
        coinsback += 4;
      }

    gameRef.gameAutoBattle.player1.currentcredits += coinsback;

      if(shiptosell.bottombarposition == 0){
        gameRef.gameAutoBattle.player1.team.remove(shiptosell);
        gameRef.gameAutoBattle.map.maincells[shiptosell.mainfieldis].releaseCellsAndMap(shiptosell.cellfields, shiptosell);
        shiptosell.destroy();
      }else {
        gameRef.gameAutoBattle.bottomBar.removeship(shiptosell);

      }
      destroy();
  }

}