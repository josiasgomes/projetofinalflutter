import 'package:flutter/material.dart';

class CadastroClientes extends StatelessWidget {
  const CadastroClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Clientes', style: TextStyle(
          color: Color.fromARGB(255, 177, 17, 188)
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
          children: [
            Text('Nome completo:', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              ),
            labelText: 'digite aqui...',
            labelStyle: TextStyle(color: Color.fromARGB(100, 192, 192, 192),
            )
          ),
        ),
        ]//ATÉ AQUI - CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
      ),
      )
    );
  }
}