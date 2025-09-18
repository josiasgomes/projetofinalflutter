import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/linha_icones.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

void main() {
  runApp(MaterialApp(
    home: MateriaisEServicosPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MateriaisEServicosPage extends StatelessWidget {
  final TextEditingController materiaisController = TextEditingController();
  final TextEditingController servicosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Materiais e Serviços',
        automaticallyImplyLeading: true, // No back button on this screen
      ),


//INICIO BODY

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Materiais:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
              ),
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: materiaisController,
                maxLines: 4,
                decoration: InputDecoration.collapsed(
                  hintText: 'Cadastre aqui seus materiais',
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Serviços:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
              ),
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: servicosController,
                maxLines: 4,
                decoration: InputDecoration.collapsed(
                  hintText: 'Cadastre aqui seus serviços',
                ),
              ),
            ),
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
        ),
      ),


//ENCERRA O BODY

      bottomNavigationBar: BarraNavegacaoPrincipal()
    );
  }
}
