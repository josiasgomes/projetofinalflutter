import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

class CadastroClientes extends StatelessWidget {
  const CadastroClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastrar Cliente',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            //CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
            children: [
              CampoLabel(label: "Nome completo:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "CPF/CNPJ:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "Telefone:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "Email:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "Endereço:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "CEP:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoLabel(label: "Cidade:", placeholder: "digite aqui..."),
              const SizedBox(height: 20),
              const Row(
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
      bottomNavigationBar: BarraNavegacaoPrincipal(),
    );
  }
}
