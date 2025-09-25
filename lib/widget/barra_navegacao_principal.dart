
import 'package:flutter/material.dart';
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                    tooltip: 'Início',
                  )
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FazerOrcamentos()),
                      );
                    },
                    tooltip: 'Início',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
