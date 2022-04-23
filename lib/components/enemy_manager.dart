import 'dart:async';
import 'dart:math';

import 'package:akashjan/components/enemy.dart';
import 'package:akashjan/components/enemy_sprite_animation.dart';
import 'package:akashjan/screens/game_page.dart';
import 'package:flame/components.dart';

class EnemyManager extends Component with HasGameRef<GamePage>{
  late Timer _timer;
  EnemyManager():super(){
    _timer = Timer(1,onTick: _spawnEnemy,repeat: true);
  }

  final EnemySpriteAnimation _enemySpriteAnimation = EnemySpriteAnimation();
  Random _random = Random();

  void _spawnEnemy() async{
    Vector2 position = Vector2(_random.nextDouble()*gameRef.size.x,0);
    SpriteAnimation enemyAnimation = await _enemySpriteAnimation.getEnemy1();
    Enemy enemy = Enemy(position,enemyAnimation);
    this.add(enemy);
  }
  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    _timer.start();
  }
  @override
  void onRemove() {
    // TODO: implement onRemove
    super.onRemove();
    _timer.stop();
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    _timer.update(dt);
  }

}