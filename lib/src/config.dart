import 'dart:ui';

const List<Color> brickColors = [
  Color(0xfff94144),
  Color(0xfff3722c),
  Color(0xfff8961e),
  Color(0xfff9844a),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  Color(0xff4d908e),
  Color(0xff277da1),
  Color(0xff577590),
];

// Screen config
const double gameWidth = 350.0;
const double gameHeight = 700.0;

// Ball config
const double ballRadius = gameHeight * 0.02;
const double batWidth = gameWidth * 0.2;
const double batHeight = ballRadius * 2;
const double batStep = gameWidth * 0.05;

// Brick config
const double brickGutter = gameWidth * 0.015;
final double brickWidth = (gameWidth - (brickGutter * (brickColors.length + 1))) / brickColors.length;
const double brickHeight = gameHeight * 0.03;
const double difficultyModifier = 1.03; 
