


import 'package:flame/components.dart';

enum EnumGlobalsBackgroundElements {

  AnimatedElementBlackHole1(path: "background/elements/BlackHole.png", amount: 50, stepTime: 0.1,
    sizeimageX: 201.02, sizeimageY: 202),
  AnimatedElementPlanetGas1(path: "background/elements/PlanetGas1.png", amount: 50, stepTime: 0.1,
  sizeimageX: 300, sizeimageY: 300),
  AnimatedElementPlanetGas2(path: "background/elements/PlanetGas2.png", amount: 50, stepTime: 0.1,
      sizeimageX: 100, sizeimageY: 100),
  AnimatedElementPlanetGas3(path: "background/elements/PlanetGas3.png", amount: 50, stepTime: 0.1,
      sizeimageX: 100, sizeimageY: 100),
  AnimatedElementPlanetGas4(path: "background/elements/PlanetGas4.png", amount: 50, stepTime: 0.1,
      sizeimageX: 100, sizeimageY: 100),
  AnimatedElementAsteroid(path: "background/elements/Asteroid1.png", amount: 7, stepTime: 0.1,
      sizeimageX: 96, sizeimageY: 96),
  ;


  const EnumGlobalsBackgroundElements({
    required this.path,
    required this.amount,
    required this.stepTime,
    required this.sizeimageX,
    required this.sizeimageY,
  });

  final String path;
  final int amount;
  final double stepTime;
  final double sizeimageX;
  final double sizeimageY;

}