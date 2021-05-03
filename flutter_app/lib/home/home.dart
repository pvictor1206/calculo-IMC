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
        //Barra
        title: Text("Calculadora de IMC"),
        centerTitle: true, // Titulo no centro
        backgroundColor: Colors.red, //Cor do fundo
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      // Cor de fundo do App
      backgroundColor: Colors.lightBlueAccent,
      // Corpo
      body: Column(
        // Tudo que estiver na coluna vai ocupar toda a largura
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_pin_outlined, size: 120.0, color: Colors.red),
          //Campo onde podera digitar texto
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.red)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.red)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
