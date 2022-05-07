import 'dart:ui';
import 'package:akashjan/constants/Dimens.dart';
import 'package:akashjan/components/Player.dart';
import 'package:akashjan/constants/environment.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class PowerUp extends SpriteAnimationComponent with HasHitboxes,HasGameRef,Collidable{
  PowerUp(this._enemyPosition,this._spriteAnimation,this._onCollide) : super(size: powerUpSize);
  final double _fallingSpeed = 200;
  Vector2 _enemyPosition;
  SpriteAnimation _spriteAnimation;
  Function _onCollide;
  final _shape = HitboxCircle(normalizedRadius: 0.5);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = _enemyPosition;
    animation = _spriteAnimation;
    anchor = Anchor.center;
  }

  @override
  void onMount() {
    super.onMount();
    addHitbox(_shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if(other is Player){
      removeFromParent();
      _onCollide.call(intersectionPoints.first);
    }
  }

  @override
  void update(double delta) {
    super.update(delta);
    this.position += Vector2(0,1)*_fallingSpeed*delta;
    if(this.position.y > gameRef.size.y){
      this.removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    try{
      _shape.render(canvas, Environment.instance.getHitBoxStroke());
    }catch(e){}
  }
}