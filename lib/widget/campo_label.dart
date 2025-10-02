import 'package:flutter/material.dart';

class CampoLabel extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;

  const CampoLabel({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usamos Column, que por padrão, tenta ocupar a largura máxima disponível
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
        // Removida a largura fixa (width: 330)
        // O Container agora se expande para a largura total do seu pai
        Container(
          //width: 330, <-- REMOVIDO PARA RESPONSIVIDADE
          //height: 50, <-- Removido também, pois o TextField ajusta a altura
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
            // Adicionado padding interno ao TextField para melhor espaçamento do texto
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                // Para remover a linha padrão do OutlineInputBorder, pode-se usar borderSide: BorderSide.none
                borderSide:
                    BorderSide.none, // O Sombra do Container substitui a borda
              ),
              // Alterado de labelText para hintText, pois labelText geralmente aparece acima
              // ou com animação quando o campo é focado. hintText é um placeholder estático.
              hintText: placeholder,
              hintStyle: const TextStyle(color: Color(0xffC0C0C0)),
              filled: true,
              fillColor:
                  Colors.transparent, // Já que a cor de fundo está no Container
            ),
          ),
        ),
      ],
    );
  }
}
