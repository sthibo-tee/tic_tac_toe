import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/components/logic/game_logic.dart';
import 'square.dart';

class GameBoard extends StatelessWidget {
  final GameLogic gameLogic;

  const GameBoard({super.key, required this.gameLogic});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            int index = row * 3 + col;
            return Square(
              value: gameLogic.gameBoard[index],
              onTap: () => gameLogic.onSelect(index, context),
            );
          }),
        );
      }),
    );
  }
}
