



import 'package:flame/components.dart';
import 'package:myfirstgame/engine/bullets/IBasicBullet.dart';

class BasicWeaponCanon extends PositionComponent

{
  late List<IBasicBullet> bulletlist = [];


  late bool _hasshooted = false;
  int _maxreloadtime  = 80;
  int _currentreloadtime  = 0;
  late Vector2 _currentshipsize;
  late Vector2 _positionEnemy;

  bool _isfiring = false;


  BasicWeaponCanon(this._currentshipsize, this._maxreloadtime);

  @override
  Future<void> onLoad() async {
    position = Vector2((_currentshipsize.x / 2) ,  (_currentshipsize.y / 2));
  }
  @override
  void update(double dt)
  {
    // TODO: implement update
    super.update(dt);

    if(_isfiring){
      if(_hasshooted == true){
        _currentreloadtime--;
      }
      if(_currentreloadtime == 0){
        _currentreloadtime = _maxreloadtime;
      }
      if(_hasshooted == false){
        //print("Ship position: " + position.toString());
        if (_positionEnemy.x != 0 && _positionEnemy.y != 0) {
          //print("fire");
          bulletlist.forEach((IBasicBullet bullet)
          {
            add(bullet);
            bullet.attackTarget(position, _positionEnemy);
          });
          _hasshooted = true;
        }
      }
    }
  }


  void setPosition(Vector2 pos){
    position = pos;
  }



  void fire(bool pfire, Vector2 enemy){
    _isfiring = pfire;
    _positionEnemy = enemy;
  }

  void stopfireing()
  {
    _isfiring = false;
  }




  void addBullet(IBasicBullet bullet)
  {
    bulletlist.add(bullet);
  }











}