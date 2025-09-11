import 'package:flutter/material.dart';

class BarraNavegacao extends StatelessWidget {
  final String label;

  const BarraNavegacao({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, 
        style: const TextStyle(fontSize: 12, 
        fontWeight: FontWeight.bold, 
        fontFamily: 'Roboto')),
        const SizedBox(height: 1),
        IconButton(
          icon: const Icon(Icons.save),
          color: Color(0xffC0C0C0),
          iconSize: 50,
          onPressed: () {
            //lógica do ícone quando pressionado
          }
          ),
        ]
    );
  }
}
