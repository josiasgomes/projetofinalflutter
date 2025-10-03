import 'package:flutter/material.dart';
import 'package:myapp/src/core/database/clientes_repository.dart';
import 'package:myapp/src/model/cliente.dart';
import 'package:myapp/src/view/cadastro_clientes/cadastro_clientes.dart';
import 'package:myapp/src/view/criar_orcamentos/criar_orcamentos.dart';
import 'package:myapp/src/view/materiais_e_servicos/materiais_e_servicos.dart';
import 'package:myapp/src/view/orcamentos_salvos/orcamento_salvos.dart';
import 'package:myapp/src/view/relatorios/relatorios.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({super.key});

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final ClientesRepository _clientesRepository = ClientesRepository();
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _navigateTo(Widget screen) {
    _toggleMenu();
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Clientes',
        automaticallyImplyLeading: true, // No back button on this screen
      ),
      body: Stack(
        children: [
          StreamBuilder<List<Cliente>>(
            stream: _clientesRepository.getClienteCollection(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhum cliente cadastrado.'));
              }

              final clientes = snapshot.data!;

              return ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  final cliente = clientes[index];
                  return Padding(
                    // Use a fraction of the screen width for horizontal padding
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04, // 4% of screen width
                      vertical: 8.0, // Vertical padding can often remain fixed
                    ),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        // Use responsive padding inside the ListTile as well
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05, // 5% of screen width
                          vertical: 10,
                        ),
                        title: Text(
                          cliente.name,
                          // Use theme-based text styles for responsiveness
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Action when clicking on the client (e.g., go to client details screen)
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          if (_isMenuOpen) _buildMenuOverlay(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleMenu,
        elevation: 2.0,
        child: Icon(_isMenuOpen ? Icons.close : Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }

  Widget _buildMenuOverlay() {
    return GestureDetector(
      onTap: _toggleMenu, // Close menu when tapping outside
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90.0, left: 20, right: 20),
            child: Material(
              color: Colors.transparent,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}