import 'package:flutter/material.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class MateriaisEServicosPage extends StatelessWidget {
  final TextEditingController materiaisController = TextEditingController();
  final TextEditingController servicosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Acessa o tamanho da tela para possíveis ajustes de layout/tamanho de fonte
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            // Implementar lógica de navegação de volta (Ex: Navigator.pop(context))
          },
        ),
        title: Text(
          'Materiais e Serviços',
          // O tamanho da fonte pode ser ajustado com base na largura da tela
          style: TextStyle(
            color: Colors.purple,
            fontSize: screenSize.width * 0.05, // Exemplo de ajuste responsivo
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: screenSize.width * 0.04, // Raio responsivo
              backgroundImage: AssetImage('assets/avatar.png'), // substitua com imagem local
            ),
          ),
        ],
      ),
      // **Chave para a responsividade: SingleChildScrollView**
      // Garante que o conteúdo pode ser rolado, evitando overflows em telas pequenas ou com teclado aberto.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Materiais:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.045, // Tamanho de fonte responsivo
              ),
            ),
            SizedBox(height: 8),
            // O Container se expande para a largura total disponível
            Container(
              // Usar 'width: double.infinity' é opcional aqui, pois a Column já estica o Container.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
              ),
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: materiaisController,
                maxLines: null, // Mudar para 'null' permite que o campo cresça dinamicamente
                minLines: 4,     // Define uma altura mínima
                keyboardType: TextInputType.multiline, // Opcional, mas útil para campos de texto longos
                decoration: InputDecoration.collapsed(
                  hintText: 'Cadastre aqui seus materiais',
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Serviços:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.045, // Tamanho de fonte responsivo
              ),
            ),
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
                maxLines: null, // Permite que o campo cresça dinamicamente
                minLines: 4,     // Define uma altura mínima
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration.collapsed(
                  hintText: 'Cadastre aqui seus serviços',
                ),
              ),
            ),
            // Adicionando um espaço no final para garantir que o último campo não fique preso
            // pela BarraNavegacaoPrincipal ou por margens da tela ao rolar.
            SizedBox(height: screenSize.height * 0.05),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacaoPrincipal(),
    );
  }
}