import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/bandit.dart';
import 'package:bonfire_projeto/game.dart';
import 'package:bonfire_projeto/home_page.dart';
import 'package:bonfire_projeto/lamp.dart';
import 'package:bonfire_projeto/personagem_principal.dart';
import 'package:bonfire_projeto/player_overlay.dart';
import 'package:flutter/material.dart';


final double TileSize = 32;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Gustavo Martim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
