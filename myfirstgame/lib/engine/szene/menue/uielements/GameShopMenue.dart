



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/Button.dart';
import 'package:myfirstgame/engine/szene/menue/uielements/ShopButton.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

import '../../../loader/ImageLoader.dart';

class GameShopMenue  extends SpriteComponent with HasGameRef<MySpaceGame>

{


 List<Button> buttons = [];


 @override
 Future<void> onLoad() async
 {
  parent = gameRef;
  sprite = ImageLoader.sprites[EnumImages.UICardTwo];
  position = Vector2(0, gameRef.size[1] / 2 - 200);
  size = Vector2(gameRef.size[0], gameRef.size[1] / 5);

  buttons.add(ShopButton(Vector2(position.x + 20, position.y + 20), Vector2(90, 90), addShiptoGame));
  buttons.add(ShopButton(Vector2(position.x + 120, position.y + 20), Vector2(90, 90), addShiptoGame));
  buttons.add(ShopButton(Vector2(position.x + 220, position.y + 20), Vector2(90, 90), addShiptoGame));
  buttons.forEach((element) {add(element);});

 }


 void addShiptoGame(){

 }


  void destroy()
  {
   buttons.forEach((element) {element.destroy();});
   gameRef.remove(this);
  }










}