import 'package:flutter/material.dart';

class LinhaIcones extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed; // Adicionado para tornar o botão funcional

  const LinhaIcones({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed, // Opcional, mas recomendado para botões
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Obter a largura total da tela (do MediaQuery)
    final double screenWidth = MediaQuery.of(context).size.width;

    // 2. Definir tamanhos responsivos:
    // Exemplo: 10% da largura da tela para o tamanho do ícone, com limites
    double responsiveIconSize = screenWidth * 0.10;
    
    // Garantir um tamanho mínimo e máximo para o ícone
    // (Ex: Mínimo 40, Máximo 60)
    responsiveIconSize = responsiveIconSize.clamp(40.0, 60.0); 

    // Exemplo: Tamanho da fonte adaptável, com limite mínimo de 12
    double responsiveFontSize = screenWidth * 0.035;
    responsiveFontSize = responsiveFontSize.clamp(12.0, 16.0); 

    return Column(
      mainAxisSize: MainAxisSize.min, // Ocupa o mínimo de espaço na Column
      children: [
        IconButton(
          icon: Icon(icon),
          color: const Color(0xff000000),
          // Usando o tamanho responsivo
          iconSize: responsiveIconSize,
          onPressed: onPressed ?? () {
            // Lógica Padrão/Vazia
          },
        ),
        Text(
          label,
          style: TextStyle(
            // Usando o tamanho responsivo
            fontSize: responsiveFontSize,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}