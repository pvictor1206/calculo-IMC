import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true, // Titulo no centro
        backgroundColor: Colors.red, //Cor do fundo
        actions: [
          IconButton(icon: Icon(Icons.refresh),
              onPressed: () {},)
        ],
      ), //Barra
    );
  }
}
