import 'package:flutter/material.dart';

class BarraNavegacaoPdf extends StatelessWidget {
  final String label;

  const BarraNavegacaoPdf({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.save),
          color: Color(0xff000000),
          iconSize: 50,
          onPressed: () {
            //lógica do ícone quando pressionado
          }
          ),
        //const SizedBox(height: 1)
        Text(label, 
        style: const TextStyle(fontSize: 12, 
        fontWeight: FontWeight.bold, 
        fontFamily: 'Roboto'))
        ]
    );
  }
}
