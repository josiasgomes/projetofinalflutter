import 'package:flutter/material.dart';
import 'package:myapp/src/view/cadastro_clientes/cadastro_clientes.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class NavBar extends StatelessWidget {
  final Widget body;
  final String title;
const NavBar({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroClientes()),
          );
        },
        backgroundColor: const Color(0xFF0D47A1), // Azul escuro para o botão
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BarraNavegacaoPrincipal(
        onHomePressed: () {
          // Lógica para ir para Home
        },
        onListPressed: () {
          // Lógica para ir para Orçamentos
        },
      ),
    );
  }
}
