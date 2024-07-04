import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Bat extends PositionComponent with DragCallbacks, HasGameReference<BrickBreaker> {
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size
  }) : super(
    anchor: Anchor.center,
    children: [RectangleHitbox()],
  );

  final Radius cornerRadius;
  
  final _paint = Paint()
    ..color = const Color(0xff1e6091)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size.toSize(),
        cornerRadius
      ),
      _paint
    );
  }

  void moveBy(double dx) {
    position.x = (position.x + dx).clamp(0, game.width - size.x);
  }
}