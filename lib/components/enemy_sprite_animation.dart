import 'package:akashjan/screens/game_page.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:akashjan/constants/Constants.dart';

class EnemySpriteAnimation extends Component with HasGameRef<GamePage>{

  Future<SpriteAnimation> getEnemy1() async{
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load('enemy_1.png'),
        srcSize: Vector2(1024, 1024),
    );
    return spriteSheet.createAnimation(row: 0, stepTime: enemy1AnimationSpeed, to: 3);
  }

}