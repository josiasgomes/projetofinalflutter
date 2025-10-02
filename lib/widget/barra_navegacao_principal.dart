import 'package:flutter/material.dart';
import 'package:myapp/src/core/theme/app_colors.dart';
import 'package:myapp/src/view/criar_orcamentos/criar_orcamentos.dart';
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
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      elevation: 12.0,
      // Altura fixa e segura para a barra de navegação.
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(
            context,
            icon: Icons.home_outlined,
            tooltip: 'Início',
            onPressed: () {
              if (onHomePressed != null) {
                onHomePressed!();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              }
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.edit_document,
            tooltip: 'Orçamentos',
            onPressed: () {
              if (onListPressed != null) {
                onListPressed!();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FazerOrcamentos()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    {
      required IconData icon,
      required String tooltip,
      required VoidCallback onPressed,
    }
  ) {
    // Usar Expanded para que cada item ocupe o mesmo espaço horizontal.
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Center(
          // FittedBox é a solução definitiva para escalar o conteúdo e evitar overflow.
          child: FittedBox(
            fit: BoxFit.contain, // Garante que o conteúdo caiba sem distorcer.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon, 
                  color: AppColors.primary, 
                  size: 30, // Tamanho base do ícone.
                ),
                const SizedBox(height: 5), // Espaçamento.
                Text(
                  tooltip, 
                  style: TextStyle(
                    fontSize: 14, // Tamanho base da fonte.
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
