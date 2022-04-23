import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:flame/input.dart';
import '../screens/game_page.dart';

class Player extends SpriteAnimationComponent with HasGameRef,HasHitboxes,Draggable {
  Player() : super(size: Vector2(283/3, 137/3)){
    addHitbox(HitboxRectangle());
  }

  Direction direction = Direction.none;
  late final SpriteAnimation _standingAnimation;
  final double _animationSpeed = 0.05;
  Vector2? dragDeltaPosition;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = gameRef.size/2;
    _loadAnimations().then((_) => {animation = _standingAnimation});
  }

  @override
  void update(double delta) {
    super.update(delta);
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('b_17_type_1.png'),
      srcSize: Vector2(849, 411),
    );
    _standingAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 3);
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (parent is! GamePage) {
      return true;
    }
    print(".........................Drag::"+info.raw.globalPosition.dx.toString());
    print(".................................Game::"+gameRef.size.x.toString());
    if(info.raw.globalPosition.dx >= size.x/2 && info.raw.globalPosition.dx <= (gameRef.size.x-size.x/2) &&
    info.raw.globalPosition.dy >= size.y/2 && info.raw.globalPosition.dy <= (gameRef.size.y-size.y/2)){
      final dragDeltaPosition = this.dragDeltaPosition;
      if (dragDeltaPosition == null) {
        return false;
      }
      position.setFrom(info.eventPosition.game - dragDeltaPosition);
      return false;
    }
    return true;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }

}