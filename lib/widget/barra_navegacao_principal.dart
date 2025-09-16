
import 'package:flutter/material.dart';

class BarraNavegacaoPrincipal extends StatelessWidget {
  const BarraNavegacaoPrincipal({
    super.key,
    this.onHomePressed,
    this.onNotificationsPressed,
    this.onListPressed,
    this.onSettingsPressed,
  });

  final VoidCallback? onHomePressed;
  final VoidCallback? onNotificationsPressed;
  final VoidCallback? onListPressed;
  final VoidCallback? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    // Cor roxa personalizada, semelhante à da imagem
    const Color roxoPrincipal = Color(0xFF6A1B9A);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      elevation: 12.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Ícones da Esquerda
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined, color: roxoPrincipal, size: 30),
                    onPressed: onHomePressed,
                    tooltip: 'Início',
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, color: roxoPrincipal, size: 30),
                    onPressed: onNotificationsPressed,
                    tooltip: 'Notificações',
                  ),
                ],
              ),
            ),
            // Ícones da Direita
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_document, color: roxoPrincipal, size: 30),
                    onPressed: onListPressed,
                    tooltip: 'Orçamentos',
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined, color: roxoPrincipal, size: 30),
                    onPressed: onSettingsPressed,
                    tooltip: 'Configurações',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
