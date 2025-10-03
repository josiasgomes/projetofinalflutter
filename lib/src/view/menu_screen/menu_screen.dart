import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth/auth_service.dart';
import 'package:myapp/src/core/theme/app_colors.dart';
import 'package:myapp/src/view/cadastro_clientes/cadastro_clientes.dart';
import 'package:myapp/src/view/clientes/clientes_screen.dart';
import 'package:myapp/src/view/criar_orcamentos/criar_orcamentos.dart';
import 'package:myapp/src/view/materiais_e_servicos/materiais_e_servicos.dart';
import 'package:myapp/src/view/orcamentos_salvos/orcamento_salvos.dart';
import 'package:myapp/src/view/relatorios/relatorios.dart';
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
    final size = MediaQuery.of(context).size;

    // Determina o número de colunas com base na largura da tela
    final crossAxisCount = size.width < 600 ? 2 : 4;
    // Define o espaçamento proporcional à largura da tela
    final spacing = size.width * 0.04;
    // Calcula a proporção de aspecto para os itens da grade
    final aspectRatio = size.width / (size.height * 0.6);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Menu',
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(spacing),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: aspectRatio, 
          children: [
            _buildMenuItem(
              context,
              icon: Icons.person_add,
              text: 'Cadastro de Cliente',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroClientes()),
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
                  MaterialPageRoute(builder: (context) => const ClientsListScreen()),
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
                  MaterialPageRoute(builder: (context) => const FazerOrcamentos()),
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
                  MaterialPageRoute(builder: (context) => const OrcamentosSalvos()),
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
                  MaterialPageRoute(
                    builder: (context) => const MateriaisEServicosPage(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.assignment,
              text: 'Relatórios',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RelatoriosScreen()),
                );
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
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
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
        child: LayoutBuilder( // Usar LayoutBuilder para obter o tamanho do item
          builder: (context, constraints) {
            final iconSize = constraints.maxHeight * 0.4; // 40% da altura do card
            final verticalGap = constraints.maxHeight * 0.08; // 8% de espaçamento

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: iconSize, color: AppColors.primary),
                SizedBox(height: verticalGap),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
