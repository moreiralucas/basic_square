import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final myGame = MyGame();
  runApp(myGame.widget);
}

class MyGame extends Game {
  static const int squareSpeed = 400;
  Rect squarePos = Rect.fromLTWH(0, 0, 100, 100);
  int squareDirection = 1;
  static final squarePaint = BasicPalette.white.paint;
  Size size;

  MyGame() {
    initialize();
  }

  @override
  void update(double dt) {
    squarePos = squarePos.translate(squareSpeed * squareDirection * dt, 0);
    if (squareDirection == 1 && squarePos.right > size.width) {
      squareDirection = -1;
    } else if (squareDirection == -1 && squarePos.left < 0) {
      squareDirection = 1;
    }
  }

  initialize() async {
    size = await Flame.util.initialDimensions();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(squarePos, squarePaint);
  }
}
