import 'package:akashjan/constants/Dimens.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteAnimationComponent with HasHitboxes,HasGameRef{
  Enemy(this._enemyPosition,this._spriteAnimation) : super(size: enemy_1_size){
    addHitbox(HitboxRectangle());
  }
  final double _fallingSpeed = 250;
  Vector2 _enemyPosition;
  SpriteAnimation _spriteAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = _enemyPosition;
    animation = _spriteAnimation;
  }

  @override
  void update(double delta) {
    super.update(delta);
    this.position += Vector2(0,1)*_fallingSpeed*delta;
    if(this.position.y > gameRef.size.y){
      this.removeFromParent();
    }
  }
}