import 'dart:math';

import 'package:flame/components.dart';

class Bullet extends SpriteComponent{
  double bulletSpeed = 600;
  Bullet({
    Sprite? sprite,
    Vector2? position,
    Vector2? size
  }):super(sprite: sprite,position: position,size: size){
    angle = pi/2;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    this.position += Vector2(0,-1)*bulletSpeed*dt;
    if(this.position.y < 0){
      removeFromParent();
    }
  }
}