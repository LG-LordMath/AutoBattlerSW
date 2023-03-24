



import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:myfirstgame/game/MySpaceGame.dart';

class Button extends SpriteComponent with Tappable, HasGameRef<MySpaceGame>

{
  final String _imagepath = 'ButtonN.png';
  final double _imagesizex = 50;
  final double _imagesizey = 50;



  @override
  Future<void> onLoad() async
  {
    super.onLoad();
    if(_imagepath.isNotEmpty){
      sprite = await gameRef.loadSprite(_imagepath); }
      size = Vector2(_imagesizex, _imagesizey);
      position = Vector2(0, 0);
  }

  @override
  bool onTapDown(TapDownInfo event) {
    try {
      print("Tabbed");
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }


  
}