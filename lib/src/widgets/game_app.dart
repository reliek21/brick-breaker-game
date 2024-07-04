import 'package:flame/game.dart' as flame;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../brick_breaker.dart';
import '../components/components.dart';
import '../config.dart';
import 'overlay_screen.dart';
import 'score_card.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final BrickBreaker game;

  @override
  void initState() {
    super.initState();
    game = BrickBreaker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffa9d6e5),
                Color(0xfff2e8cf),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    ScoreCard(score: game.score),
                    Expanded(
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          if (details.delta.dx > 0) {
                            game.world.children
                                .query<Bat>()
                                .first
                                .moveBy(game.batStep);
                          } else if (details.delta.dx < 0) {
                            game.world.children
                                .query<Bat>()
                                .first
                                .moveBy(-game.batStep);
                          }
                        },
                        onTap: game.startGame,
                        child: FittedBox(
                          child: SizedBox(
                            width: gameWidth,
                            height: gameHeight,
                            child: flame.GameWidget(
                              game: game,
                              overlayBuilderMap: {
                                PlayState.welcome.name: (context, game) =>
                                    const OverlayScreen(
                                      title: 'TAP TO PLAY',
                                      subtitle: 'Use arrow keys or swipe',
                                    ),
                                PlayState.gameOver.name: (context, game) =>
                                    const OverlayScreen(
                                      title: 'G A M E   O V E R',
                                      subtitle: 'Tap to Play Again',
                                    ),
                                PlayState.won.name: (context, game) =>
                                    const OverlayScreen(
                                      title: 'Y O U   W O N ! ! !',
                                      subtitle: 'Tap to Play Again',
                                    ),
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
