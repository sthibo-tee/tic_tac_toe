import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/components/logic/game_logic.dart';

class ScoreBoard extends StatelessWidget {
  final GameLogic gameLogic;

  const ScoreBoard({super.key, required this.gameLogic});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildScoreColumn('Player 1 (X)', gameLogic.playerOneScore),
        _buildScoreColumn('Player 2 (O)', gameLogic.playerTwoScore),
        _buildScoreColumn('Draw', gameLogic.drawScore),
      ],
    );
  }

  Widget _buildScoreColumn(String label, int score) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('$score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
