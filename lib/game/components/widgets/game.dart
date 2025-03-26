import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/game/components/widgets/main_game.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int _selectedIndex = 0;
  List<String> _gameBoard = List.filled(9, ''); 
  bool _isGameOver = false;
  String _winner = '';
  int _playerOneScore = 0;
  int _playerTwoScore = 0;
  int _drawScore = 0;

  _GameState() {
    _initializeGame();
  }

  void _initializeGame() {
    _gameBoard = List.filled(9, '');
    _isGameOver = false;
    _winner = '';
  }

  void _onSelect(int index) {
    if (_isGameOver || _gameBoard[index].isNotEmpty) {
      return;
    }

    setState(() {
      _gameBoard[index] = _selectedIndex == 0 ? 'X' : 'O';
      _selectedIndex = _selectedIndex == 0 ? 1 : 0;
      _checkWinner();
    });
  }

  void _checkWinner() {
    for (int i = 0; i < 8; i++) {
      int a = _winningCombination[i][0];
      int b = _winningCombination[i][1];
      int c = _winningCombination[i][2];

      if (_gameBoard[a].isNotEmpty && _gameBoard[a] == _gameBoard[b] && _gameBoard[a] == _gameBoard[c]) {
        setState(() {
          _isGameOver = true;
          _winner = _gameBoard[a];
          if (_winner == 'X') {
            _playerOneScore++;
          } else {
            _playerTwoScore++;
          }
        });
        _winningMessage();
        _resetGame();
      }
    }

    if (!_gameBoard.contains('')) {
      setState(() {
        _isGameOver = true;
        _drawScore++;
      });
      _winningMessage();
      _resetGame();
    }
  }

  final List<List<int>> _winningCombination = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void _resetGame() {
    setState(() {
      _initializeGame();
    });
  }

  void _winningMessage() {
    if (_winner.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Player $_winner wins!'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('It\'s a draw!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildSquare(int index) {
    return GestureDetector(
      onTap: () => _onSelect(index),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            _gameBoard[index],
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Player 1 (X)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_playerOneScore',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Player 2 (O)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_playerTwoScore',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Draw',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_drawScore',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                _buildSquare(0),
                _buildSquare(1),
                _buildSquare(2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSquare(3),
              _buildSquare(4),
              _buildSquare(5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSquare(6),
              _buildSquare(7),
              _buildSquare(8),
            ],
          ),
        ],
      ),
    );
  }
}