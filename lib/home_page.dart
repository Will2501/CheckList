import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'check_mecanica.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _placaController = TextEditingController();
  final _kmController = TextEditingController();

  void _buscarPlaca() {
    final placa = _placaController.text;
    final kmAtual = _kmController.text;
    // Aqui você pode adicionar a lógica para buscar a placa do veículo
    print('Buscando placa: $placa KM Atual: $kmAtual');
    // Navegar para a página CheckMecanicaPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckMecanicaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca de Placa de Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _placaController,
              maxLength: 7,
              decoration: InputDecoration(
                labelText: 'Digite a placa do veículo',
                counterText: '',  // Remove o contador de caracteres exibido na parte inferior
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),  // Permitir apenas letras e números
                UpperCaseTextFormatter(),  // Converter para maiúsculas
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _kmController,
              decoration: InputDecoration(
                labelText: 'KM Atual',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,  // Permitir apenas números
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buscarPlaca,
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _placaController.dispose();
    _kmController.dispose();
    super.dispose();
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}