import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
import 'package:myapp/src/core/theme/app_colors.dart';
import 'package:myapp/src/view/CadastroClientes/cadastro_clientes.dart';
import 'package:myapp/src/view/clients_screen/clients_screen.dart';
import 'package:myapp/src/view/criar_orcamentos/criar_orcamentos.dart';
import 'package:myapp/src/view/materiais_e_servicos/materiais_e_servicos.dart';
import 'package:myapp/src/view/orcamentos_salvos/orcamento_salvos.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  void _signOut() async {
    try {
      await authService.value.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. Obter a largura da tela com MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    // 2. Determinar o número de colunas com base na largura da tela
    // Se a tela for menor que 600 pixels (típico de celulares), usa 2 colunas.
    // Se for maior, usa 4 colunas (bom para tablets e web).
    final crossAxisCount = screenWidth < 600 ? 2 : 4;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Menu',
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 3. Usar a contagem de colunas dinâmica
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuItem(
              context,
              icon: Icons.person_add,
              text: 'Cadastro de Cliente',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroClientes()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.list_alt,
              text: 'Clientes cadastrados',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientsListScreen()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.monetization_on,
              text: 'Fazer orçamento',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FazerOrcamentos()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.trending_up,
              text: 'Orçamentos salvos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrcamentosSalvos()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.layers,
              text: 'Materiais e serviços',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MateriaisEServicosPage()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.assignment,
              text: 'Relatórios',
              onTap: () {
                // Ação para Relatórios
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.exit_to_app,
              text: 'Sair',
              onTap: _signOut,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacaoPrincipal(),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
