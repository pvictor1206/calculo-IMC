import 'package:flutter/material.dart';
import 'package:flutter_app/home/home.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      home: Home(), //Tela principal
    );
  }
}