// lib/campo_texto_personalizado.dart
import 'package:flutter/material.dart';

class CampoLabel extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller; // Controlador adicionado

  const CampoLabel({
    Key? key,
    required this.label,
    required this.placeholder,
    this.controller, // Construtor atualizado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 330,
          //height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: controller, // Controlador atribuído ao campo de texto
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              labelText: placeholder,
              labelStyle: const TextStyle(color: Color(0xffC0C0C0)),
            ),
          ),
        ),
      ],
    );
  }
}
