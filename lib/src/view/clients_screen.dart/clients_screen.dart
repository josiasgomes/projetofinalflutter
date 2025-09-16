import 'package:flutter/material.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes Cadastrados'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Volta para a tela anterior
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 6, // Este número será dinâmico, vindo do banco de dados
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                title: Text(
                  'Cliente ${index + 1}', // Este texto será o nome do cliente
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Ação ao clicar no cliente (por exemplo, ir para a tela de detalhes do cliente)
                },
              ),
            ),
          );
        },
      ),
      // Botão de Ação Flutuante centralizado
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão de adicionar
        },
        backgroundColor: Colors.blue.shade800,
        elevation: 8.0,
        child: const Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Nova barra de navegação
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}
