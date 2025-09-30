import 'package:flutter/material.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

/*void main() {
  runApp(MaterialApp(
    home: MateriaisEServicosPage(),
    debugShowCheckedModeBanner: false,
  ));
}*/

class MateriaisEServicosPage extends StatelessWidget {
  final TextEditingController materiaisController = TextEditingController();
  final TextEditingController servicosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {},
        ),
        title: Text(
          'Materiais e Serviços',
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/avatar.png'), // substitua com imagem local
            ),
          ),
        ],
      ),
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
          ],
        ),
      ),
    bottomNavigationBar: BarraNavegacaoPrincipal(),
    ); //Scaffold
  }
}
