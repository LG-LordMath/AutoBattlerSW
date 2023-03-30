



import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/szene/background/EnumGlobalsBackgroundElements.dart';




class AnimatedBackgroundElements extends SpriteAnimationComponent
{

  double _scalefactor = 3.0;
  late EnumGlobalsBackgroundElements _loadimage;

  AnimatedBackgroundElements(this._loadimage);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    Image image = await Flame.images.load(_loadimage.path);
    animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
        amount: _loadimage.amount.toInt(), stepTime: _loadimage.stepTime.toDouble(), textureSize: Vector2(_loadimage.sizeimageX.toDouble(), _loadimage.sizeimageY.toDouble())));
    size = Vector2(100, 100);


  }

}