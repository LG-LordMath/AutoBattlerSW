


import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/rockets/EnumRocketList.dart';
import 'package:myfirstgame/engine/ships/basic/BasicShip.dart';
import 'package:myfirstgame/engine/ships/basic/effects/EnumEffects.dart';

import '../../../bullets/IBasicBullet.dart';
import '../../../bullets/rockets/BulletRocketLoader.dart';

class EffectShip extends BasicShip


{

  EnumEffects effects = EnumEffects.none;

  int _maxeffecttimer = 100;
  late int _effecktimer;


  EffectShip(super.image, super.positionx, super.positiony, super.imagesizex, super.imagesizey, super.maxhp, super.maxshieldhp, super.currentteam, super.nation, super.creditcost, super.shipclass);



  void setEffect(EnumEffects enumEffects, int effecttimer)
  {
    effects = enumEffects;
    _effecktimer = effecttimer;
    _effecktimer =  _maxeffecttimer;
  }


  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(super.fight)
    {
      if(_effecktimer<=0)
      {
        activateeffect();
        _effecktimer = _maxeffecttimer;
      }
      _effecktimer--;
    }


  }

  void activateeffect()
  {
    switch(effects)
    {
      case EnumEffects.heal:
        super.hp += 300;
        break;
      case EnumEffects.masterheal:
        if(super.currentteam==1){
          gameRef.gameAutoBattle.player1.team.forEach((element) {
            element.hp+=500;
          });
        }
        break;
      case EnumEffects.shootIonenCanon:

        break;
      case EnumEffects.shootRocketOne:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketOne]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
      gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketOne);
        break;
      case EnumEffects.shootRocketTwo:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketTwo]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
        gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketTwo);
        break;
      case EnumEffects.shootRocketThree:
        IBasicBullet tempbullet = BulletRocketLoader.rockets[EnumRocketList.RocketThree]!;
        add(tempbullet);
        if(super.currentteam == 1){
          tempbullet.shoot(Vector2(absolutePosition.x + width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }else{
          tempbullet.shoot(Vector2(absolutePosition.x - width  / 2, absolutePosition.y  ), positionEnemy, super.currentteam);
        }
        gameRef.bulletRocketLoader.reloadObject(EnumRocketList.RocketThree);
        break;
    }
  }










}