import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/campo_orcamento.dart';
import 'package:myapp/widget/linha_icones.dart';

class FazerOrcamentos extends StatelessWidget {
  const FazerOrcamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Fazer Orçamentos',
        automaticallyImplyLeading: true, // No back button on this screen
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            //CÓDIGO REPRODUZIDO PARA CRIAR OUTROS CAMPOS
            children: [
              CampoOrcamento(label: "Nome do cliente:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoOrcamento(label: "Tipo de Serviço:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              CampoTextoLivre(label: "Material:", placeholder: "digite aqui..."),
              const SizedBox(height: 8),
              //CampoOrcamento(label: "Quantidade:", placeholder: "digite aqui..."),
              //const SizedBox(height: 8),
              CampoTextoLivre(label: "Observações:", placeholder: "digite aqui..."),
              const SizedBox(height: 20),
              Text("OBS: Orçamento válido por 10 dias.",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',)
              ),
              const SizedBox(height: 20),

              
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinhaIcones(label: "Salvar", icon: Icons.save),
                  LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                  //LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
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
