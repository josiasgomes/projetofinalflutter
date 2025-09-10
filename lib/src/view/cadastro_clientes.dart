import 'package:flutter/material.dart';
import 'package:myapp/widget/campo_label.dart';

class CadastroClientes extends StatelessWidget {
  const CadastroClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Clientes', style: TextStyle(
          color: Color.fromARGB(255, 177, 17, 188),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
            children: [
              CampoLabel(label: "Nome completo:", placeholder: "digite aqui..."),
              SizedBox(height: 10),
              CampoLabel(label: "CPF/CNPJ:", placeholder: "digite aqui..."),
          
          ]//ATÉ AQUI - CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
                ),
        ),
      )
    );
  }
}