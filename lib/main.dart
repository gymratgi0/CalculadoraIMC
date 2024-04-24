import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _altura = 0;
  double _peso = 0;

  // Variável para armazenar o resultado das operações
  double _imc = 0;

  String _resultado = '';

  // Função imc
  void _calculo() {
    setState(() {
      _imc = _peso / (_altura * _altura);

      if (_imc < 16) {
        _resultado = "Magreza severa";
      } else if (_imc > 16 && _imc < 16.9) {
        _resultado = "magreza moderada";
      } else if (_imc > 17 && _imc < 18.5) {
        _resultado = "magreza leve";
      } else if (_imc > 18.6 && _imc < 24.9) {
        _resultado = "peso ideal";
      } else if (_imc > 25 && _imc < 29.9) {
        _resultado = "sobrepeso";
      } else if (_imc > 30 && _imc < 34.9) {
        _resultado = "obesidade grau I";
      } else if (_imc > 35 && _imc < 39.9) {
        _resultado = "obesidade grau II ou severa";
      } else if (_imc > 40) {
        _resultado = "obesidade grau III ou mórbida";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite sua altura em metros'),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite seu peso em quilos'),
              onChanged: (value) {
                _peso = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Botões para realizar as operações
            ElevatedButton(
              onPressed: _calculo,
              child: Text('Calcular'),
            ),
            SizedBox(height: 2.0),
            // Exibição do resultado
            Text(
              'Resultado: $_imc',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _resultado,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
