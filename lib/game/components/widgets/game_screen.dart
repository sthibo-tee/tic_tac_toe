import 'package:flutter/material.dart';
import '../logic/game_logic.dart';
import 'game_board.dart';
import 'score_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameLogic _gameLogic;

  @override
  void initState() {
    super.initState();
    _gameLogic = GameLogic(updateState);
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _gameLogic.resetGame(),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScoreBoard(gameLogic: _gameLogic),
          const SizedBox(height: 20),
          GameBoard(gameLogic: _gameLogic),
        ],
      ),
    );
  }
}
