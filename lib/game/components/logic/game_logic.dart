import 'package:flutter/material.dart';
import '../widgets/utils.dart';

class GameLogic {
  List<String> gameBoard = List.filled(9, '');
  bool isGameOver = false;
  String winner = '';
  int playerOneScore = 0;
  int playerTwoScore = 0;
  int drawScore = 0;
  int currentPlayer = 0; // 0 for 'X', 1 for 'O'

  Function updateUI;

  GameLogic(this.updateUI);

  void resetGame() {
    gameBoard = List.filled(9, '');
    isGameOver = false;
    winner = '';
    updateUI();
  }

  void onSelect(int index, BuildContext context) {
    if (isGameOver || gameBoard[index].isNotEmpty) return;

    gameBoard[index] = currentPlayer == 0 ? 'X' : 'O';
    currentPlayer = 1 - currentPlayer; // Toggle player
    checkWinner(context);
    updateUI();
  }

  void checkWinner(BuildContext context) {
    final List<List<int>> winningCombination = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (var combo in winningCombination) {
      if (gameBoard[combo[0]].isNotEmpty &&
          gameBoard[combo[0]] == gameBoard[combo[1]] &&
          gameBoard[combo[0]] == gameBoard[combo[2]]) {
        isGameOver = true;
        winner = gameBoard[combo[0]];
        winner == 'X' ? playerOneScore++ : playerTwoScore++;
        showWinningMessage(context, 'Player $winner wins!');
        resetGame();
        return;
      }
    }

    if (!gameBoard.contains('')) {
      isGameOver = true;
      drawScore++;
      showWinningMessage(context, 'It\'s a draw!');
      resetGame();
    }
  }
}
