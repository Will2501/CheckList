import 'package:flutter/material.dart';

class CheckMecanicaPage extends StatefulWidget {
  @override
  _CheckMecanicaPageState createState() => _CheckMecanicaPageState();
}

class _CheckMecanicaPageState extends State<CheckMecanicaPage> {
  String _direcao = 'Bom';
  String _freio = 'Bom';
  String _motor = 'Bom';
  String _cambio = 'Bom';
  String _embreagem = 'Bom';
  String _suspDianteira = 'Bom';
  String _suspTraseira = 'Bom';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Mecânico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildItem('Direção', _direcao),
            _buildItem('Freio', _freio),
            _buildItem('Motor', _motor),
            _buildItem('Câmbio', _cambio),
            _buildItem('Embreagem', _embreagem),
            _buildItem('Suspensão Dianteira', _suspDianteira),
            _buildItem('Suspensão Traseira', _suspTraseira),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para salvar o checklist
                print('Checklist salvo!');
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            _buildRadioOption(title, 'Bom', value),
            _buildRadioOption(title, 'Reg.', value),
            _buildRadioOption(title, 'Ruim', value),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildRadioOption(String title, String option, String currentValue) {
    return Row(
      children: <Widget>[
        Radio<String>(
          value: option,
          groupValue: currentValue,
          onChanged: (value) {
            setState(() {
              switch (title) {
                case 'Direção':
                  _direcao = value!;
                  break;
                case 'Freio':
                  _freio = value!;
                  break;
                case 'Motor':
                  _motor = value!;
                  break;
                case 'Câmbio':
                  _cambio = value!;
                  break;
                case 'Embreagem':
                  _embreagem = value!;
                  break;
                case 'Suspensão Dianteira':
                  _suspDianteira = value!;
                  break;
                case 'Suspensão Traseira':
                  _suspTraseira = value!;
                  break;
              }
            });
          },
        ),
        Text(option),
      ],
    );
  }
}