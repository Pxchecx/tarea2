import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OperacionesAritmeticas(),
  ));
}

class OperacionesAritmeticas extends StatefulWidget {
  @override
  _OperacionesAritmeticasState createState() => _OperacionesAritmeticasState();
}

class _OperacionesAritmeticasState extends State<OperacionesAritmeticas> {
  final TextEditingController _primerValorController = TextEditingController();
  final TextEditingController _segundoValorController = TextEditingController();
  String _operacionSeleccionada = 'Suma';
  double? _resultado;

  void _calcularResultado() {
    final double primerValor = double.tryParse(_primerValorController.text) ?? 0;
    final double segundoValor = double.tryParse(_segundoValorController.text) ?? 0;
    switch (_operacionSeleccionada) {
      case 'Suma':
        _resultado = primerValor + segundoValor;
        break;
      case 'Resta':
        _resultado = primerValor - segundoValor;
        break;
      case 'Multiplicacion':
        _resultado = primerValor * segundoValor;
        break;
      case 'Division':
        _resultado = segundoValor != 0 ? primerValor / segundoValor : null;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a la Calculadora de Mauricio Pacheco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _primerValorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Porfavor Ingrese el primer digito',
                hintText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _segundoValorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Porfavor Ingrese el segundo digito',
                hintText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _operacionSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  _operacionSeleccionada = newValue!;
                });
              },
              items: <String>['Suma', 'Resta', 'Multiplicacion', 'Division']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: _calcularResultado,
              child: Icon(Icons.calculate),
            ),
            SizedBox(height: 14),
            Text(
              _resultado == null ? 'Resultado' : 'Total: $_resultado',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
