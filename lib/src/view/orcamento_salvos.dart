import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
//import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

class OrcamentosSalvos extends StatelessWidget {
  const OrcamentosSalvos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Orçamentos Salvos',
        automaticallyImplyLeading: true, // No back button on this screen
      ),
body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Center(
    child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Alinha o texto à esquerda
          children: [
            Text(
              "",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 330,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: "pesquisar...",
                  labelStyle: const TextStyle(color: Color(0xffC0C0C0)),
                  suffixIcon: const Icon(Icons.search, color: Color(0xffAE11BC),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LinhaIcones(label: "Salvar", icon: Icons.save),
            LinhaIcones(label: "Cancelar", icon: Icons.cancel),
            LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
          ],
        ),
        const SizedBox(height: 30),
      ],//children
    ),
  ),
),
      bottomNavigationBar: BarraNavegacaoPrincipal(),
    );
  }
}
