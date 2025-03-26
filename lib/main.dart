import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/components/widgets/game.dart';
// import 'package:tic_tac_toe/game/components/widgets/main_game.dart';
import 'package:tic_tac_toe/game/menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Menu(),
        "/game": (context) => Game(), 
        // "/play": (context) => Game(),
      },
    );
  }
}
