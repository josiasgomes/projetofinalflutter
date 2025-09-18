import 'package:flutter/material.dart';

class FiltrandoOrcamentos extends StatefulWidget {
  const FiltrandoOrcamentos({Key? key}) : super(key: key);

  @override
  State<FiltrandoOrcamentos> createState() =>
      _FiltrandoOrcamentos();
}

class _FiltrandoOrcamentos extends State<FiltrandoOrcamentos> {
  // A variável de estado para armazenar a string da opção selecionada
  String? _statusSelecionado;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ListTile para "Aprovado"
        RadioListTile<String>(
          title: const Text('Aprovado', style: TextStyle(fontWeight: FontWeight.bold),),
          value: 'aprovado',
          groupValue: _statusSelecionado,
          onChanged: (String? value) {
            setState(() {
              _statusSelecionado = value;
            });
          },
        ),
        // ListTile para "Reprovado"
        RadioListTile<String>(
          title: const Text('Reprovado', style: TextStyle(fontWeight: FontWeight.bold),),
          value: 'reprovado',
          groupValue: _statusSelecionado,
          onChanged: (String? value) {
            setState(() {
              _statusSelecionado = value;
            });
          },
        ),
        // ListTile para "Pendente"
        RadioListTile<String>(
          title: const Text('Pendente', style: TextStyle(fontWeight: FontWeight.bold),),
          value: 'pendente',
          groupValue: _statusSelecionado,
          onChanged: (String? value) {
            setState(() {
              _statusSelecionado = value;
            });
          },
        ),
      ],
    );
  }
}
