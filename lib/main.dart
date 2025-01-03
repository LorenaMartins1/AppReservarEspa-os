import 'package:flutter/material.dart';
import 'screens/spaces_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservar Espaços',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SpacesScreen(),
    );
  }
}
