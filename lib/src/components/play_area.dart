import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flame/collisions.dart'; 
import 'package:flame/components.dart';

import 'package:brick_breaker/src/brick_breaker.dart';

class PlayArea extends RectangleComponent with HasGameReference<BrickBreaker> {
  PlayArea()
  : super(
    paint: Paint()..color = const Color(0xfff2e8cf),
    children: [RectangleHitbox()]
  );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}