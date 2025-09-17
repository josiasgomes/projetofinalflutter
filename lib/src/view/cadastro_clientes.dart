import 'package:flutter/material.dart';
import 'package:myapp/widget/linha_icones.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';

class CadastroClientes extends StatelessWidget {
  const CadastroClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Clientes', style: TextStyle(
          color: Color.fromARGB(255, 177, 17, 188),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            //CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
            children: [
              CampoLabel(label: "Nome completo:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "CPF/CNPJ:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "Telefone:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "Email:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "Endereço:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "CEP:", placeholder: "digite aqui..."),
              SizedBox(height: 8),
              CampoLabel(label: "Cidade:", placeholder: "digite aqui..."),
              SizedBox(height: 20),
Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinhaIcones(label: "Salvar", icon: Icons.save),
                  LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                  LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
                ]
              ),
              SizedBox(height: 30),
          ],
          //ATÉ AQUI - CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
           ),
        ),
      ),
      

            floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          // Ação ao pressionar o botão "+"
        },
        child: Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BarraNavegacaoPrincipal()
    );
  }
}