import 'package:flutter/material.dart';

class CampoLabel extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final int maxLines; // Novo parâmetro para o número de linhas

  const CampoLabel({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller, this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            controller: controller,
            // Usa o parâmetro maxLines para definir a altura do campo
            maxLines: maxLines,
            // Ajusta o tipo de teclado para otimizar para múltiplas linhas
            keyboardType: maxLines > 1 ? TextInputType.multiline : TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                // Para remover a linha padrão do OutlineInputBorder, pode-se usar borderSide: BorderSide.none
                borderSide: BorderSide.none, // O Sombra do Container substitui a borda
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(color: Color(0xffC0C0C0)),
              filled: true,
              fillColor: Colors.transparent, // Já que a cor de fundo está no Container
            ),
          ),
        ),
      ],
    );
  }
}
