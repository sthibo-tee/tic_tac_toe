import 'package:flutter/material.dart';

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  List<String> types= ["X", "O"];
  String? selectedPlayerOneType;
  String? selectedPlayerTwoType;
  static TextEditingController playerOneController = TextEditingController();
  static TextEditingController playerTwoController = TextEditingController();

  void check(String selectedType) {
    if (selectedType == "X") {
      selectedPlayerOneType = "X";
      selectedPlayerTwoType = "O";
    } else if (selectedType == "O") {
      selectedPlayerOneType = "O";
      selectedPlayerTwoType = "X";
    }
  }

  void _checkValidInput() {
    if (playerOneController.text.isEmpty) {
      playerOneController.text = "Player 1";
    }
    if (playerTwoController.text.isEmpty) {
      playerTwoController.text = "Player 2";
    }

    selectedPlayerOneType ??= "X";

    selectedPlayerTwoType ??= "O";

    Navigator.pushNamed(context, '/play');
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              "Choose your type:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 200.0,
              // height: 50.0,
              child: Column(
                children: [
                  TextField(
                    controller: playerOneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Player 1 Name',
                      hintText: 'john',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        isExpanded: true,
                        hint: const Text('Select Type'),
                        value: selectedPlayerOneType,
                        items: types.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(), 
                        onChanged: (String? value) {
                          setState(() {
                            selectedPlayerOneType = value;
                            check(value!);
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: playerTwoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Player 2 Name',
                      hintText: 'doe',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        isExpanded: true,
                        hint: const Text('Select Type'),
                        value: selectedPlayerTwoType,
                        items: types.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedPlayerTwoType = value;
                            check(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _checkValidInput();
              },
              child: const Text('Play Game'),
            ),
          ],
        ),
      ),

    );
  }
}