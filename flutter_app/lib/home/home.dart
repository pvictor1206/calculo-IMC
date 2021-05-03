import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController(); // Peso
  TextEditingController heightController = TextEditingController(); // Altura

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields(){
    // Atualiza o App
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate(){
    // Atualiza o App
    setState(() {
      double weight = double.parse(weightController.text); // Tranformar em double
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }
      else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      }
      else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      }
      else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obsedidade Grau I (${imc.toStringAsPrecision(3)})";
      }
      else if(imc >= 34.9 && imc < 39.0){
        _infoText = "Obsedidade Grau II (${imc.toStringAsPrecision(3)})";
      }
      else {
        _infoText = "Obsedidade Grau III (${imc.toStringAsPrecision(3)})";
      }

    });

  }

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
            onPressed: _resetFields,
          )
        ],
      ),
      // Cor de fundo do App
      backgroundColor: Colors.lightBlueAccent,
      // Corpo
      // Barra Rolante doo Texto
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            // Tudo que estiver na coluna vai ocupar toda a largura
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_pin_outlined, size: 120.0, color: Colors.red),
              //Campo onde podera digitar texto
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.red)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  // Se estiver vazio
                  if(value.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.red)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  // Se estiver vazio
                  if(value.isEmpty){
                    return "Insira sua altura!";
                  }
                },
              ),
              // Botao de calcular
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
