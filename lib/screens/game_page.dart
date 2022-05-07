import 'package:akashjan/components/Player.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:akashjan/constants/Constants.dart';
import '../components/bullet_manager.dart';
import '../components/enemy_manager.dart';
import '../components/power_up_manager.dart';


class GamePage extends FlameGame with HasDraggables,HasCollidables {
  final Player _player = Player();
  late BulletManager _bulletManager;
  late EnemyManager _enemyManager;
  late PowerUpManager _powerUpManager;

  @override
  Future<void>? onLoad() async{
    _enemyManager = EnemyManager();
    _powerUpManager = PowerUpManager();
    add(_player);
    add(_enemyManager);
    add(_powerUpManager);
    _bulletManager = BulletManager(_player.position.clone()-Vector2(20,0));
    add(_bulletManager);
    _player.onColideWithPowerUps = _onColideWithPowerUps;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _bulletManager.playersPosition = _player.position.clone()+Vector2(40,0);
    /*final bullets = _bulletManager.children.whereType<Bullet>();
    final enemys = _enemyManager.children.whereType<Enemy>();
    for(var enemy in enemys){
      if(enemy.shouldRemove){
        continue;
      }
      for(var bullet in bullets){
        if(bullet.shouldRemove){
          continue;
        }
        if(enemy.containsPoint(bullet.absoluteCenter)){
          enemy.removeFromParent();
          bullet.removeFromParent();
          break;
        }
      }
      if(_player.containsPoint(enemy.absoluteCenter)){
        //TODO("Colide with player ")
      }
    }*/
  }

  _onColideWithPowerUps(){
    PowerUps? powerUp = _powerUpManager.powerups;
    if(powerUp != null){
      switch(powerUp){
        case PowerUps.bulletSpeed:
          var previousBulletSpanTime = _bulletManager.bulletSpawnTime;
          if(previousBulletSpanTime > minumumBulletSpawnTime)
            _bulletManager.bulletSpawnTime = previousBulletSpanTime-0.05;
          break;
      }
    }
  }
}