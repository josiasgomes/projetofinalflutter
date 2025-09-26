import 'package:flutter/material.dart';
import 'package:myapp/src/core/theme/app_colors.dart';
import 'package:myapp/src/view/criar_orcamentos.dart';
import 'package:myapp/src/view/menu_screen/menu_screen.dart';

class BarraNavegacaoPrincipal extends StatelessWidget {
  const BarraNavegacaoPrincipal({
    super.key,
    this.onHomePressed,
    this.onListPressed,
  });

  final VoidCallback? onHomePressed;
  final VoidCallback? onListPressed;

  @override
  Widget build(BuildContext context) {
    // 1. Obter as dimensões da tela para responsividade.
    final screenWidth = MediaQuery.of(context).size.width;

    // 2. Definir tamanhos responsivos AUMENTADOS:
    // Altura da barra: 6% da largura da tela (era 5%).
    final double barHeight = screenWidth * 0.09; 
    // Tamanho dos ícones: 90% da altura da barra (era 80%).
    final double iconSize = barHeight * 1.0; 

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white, 
      elevation: 12.0,
      
      child: Padding(
        // Centraliza os ícones verticalmente.
        padding: EdgeInsets.symmetric(vertical: (barHeight - iconSize) / 2), 
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Ícone 1 (Início)
            Flexible(
              child: IconButton(
                // Ícone com tamanho responsivo maior
                icon: Icon(Icons.home_outlined, color: AppColors.primary, size: iconSize), 
                padding: EdgeInsets.zero, 
                constraints: const BoxConstraints(), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                tooltip: 'Início',
              ),
            ),
            
            // Ícone 2 (Orçamentos)
            Flexible(
              child: IconButton(
                // Ícone com tamanho responsivo maior
                icon: Icon(Icons.edit_document, color: AppColors.primary, size: iconSize), 
                padding: EdgeInsets.zero, 
                constraints: const BoxConstraints(), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FazerOrcamentos()),
                  );
                },
                tooltip: 'Orçamentos',
              ),
            ),
          ],
        ),
      ),
    );
  }
}