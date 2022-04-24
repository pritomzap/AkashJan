import 'dart:math';

import 'package:akashjan/components/Player.dart';
import 'package:akashjan/components/bullet.dart';
import 'package:akashjan/components/enemy.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import '../components/bullet.dart';
import '../components/bullet_manager.dart';
import '../components/enemy.dart';
import '../components/enemy_manager.dart';


class GamePage extends FlameGame with HasDraggables{
  final Player _player = Player();
  late BulletManager _bulletManager;
  late EnemyManager _enemyManager;

  @override
  Future<void>? onLoad() async{
    _enemyManager = EnemyManager();
    add(_player);
    add(_enemyManager);
    _bulletManager = BulletManager(_player.position.clone()-Vector2(20,0));
    add(_bulletManager);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _bulletManager.playersPosition = _player.position.clone()+Vector2(40,0);
    final bullets = _bulletManager.children.whereType<Bullet>();
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
    }
  }
}