import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Inicial',
          style: TextStyle(color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Ação do botão do perfil
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.blue, // Cor de fundo do círculo
              child: Icon(
                Icons.person, // Ícone de pessoa
                color: Colors.white, // Cor do ícone
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuItem(
              context,
              icon: Icons.person_add,
              text: 'Cadastro de Cliente',
              onTap: () {
                // Navegar para a tela de Cadastro de Cliente
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.list_alt,
              text: 'Clientes cadastrados',
              onTap: () {
                // Navegar para a tela de Clientes cadastrados
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.monetization_on,
              text: 'Fazer orçamento',
              onTap: () {
                // Navegar para a tela de Fazer orçamento
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.trending_up,
              text: 'Orçamentos salvos',
              onTap: () {
                // Navegar para a tela de Orçamentos salvos
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.layers,
              text: 'Materiais e serviços',
              onTap: () {
                // Navegar para a tela de Materiais e serviços
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.assignment,
              text: 'Relatórios',
              onTap: () {
                // Navegar para a tela de Relatórios
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.exit_to_app,
              text: 'Sair',
              onTap: _signOut,

              //sair do app
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
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
