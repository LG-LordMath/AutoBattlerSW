

import 'package:flame/components.dart';

import '../../loader/EnumImages.dart';
import '../../loader/ImageLoader.dart';

class LevelShipBar extends PositionComponent



{
 late int level;

  LevelShipBar(this.level);


  @override
  Future<void> onLoad() async
  {
      switch(level){
        case 1:
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(5, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));
          break;
        case 2:
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(5, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(16, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));
          break;
        case 3:
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(5, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(16, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));
          add(SpriteComponent(size: Vector2(10, 10), position: Vector2(26, 40), sprite: ImageLoader.sprites[EnumImages.IconStar]));

          break;
      }
  }

  void destroy()
  {
    removeAll(children);
  }


}