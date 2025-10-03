import 'package:flutter/material.dart';
import 'package:myapp/widget/salvar_pdf.dart';

class CardOrcamento extends StatefulWidget {
  const CardOrcamento({Key? key}) : super(key: key);

  @override
  _CardOrcamentoState createState() => _CardOrcamentoState();
}

class _CardOrcamentoState extends State<CardOrcamento> {
  @override
  Widget build(BuildContext context) {
    // 1. Obter o tamanho total da tela usando MediaQuery
    final screenSize = MediaQuery.of(context).size;
    
    // Define percentuais de largura e altura que o Card deve ocupar
    // Exemplo: 85% da largura da tela e 20% da altura da tela.
    final cardWidthPercentage = 0.85; 
    final cardHeightPercentage = 0.20; 

    // Calcula os valores responsivos
    final responsiveCardWidth = screenSize.width * cardWidthPercentage;
    final responsiveCardHeight = screenSize.height * cardHeightPercentage;

    return Column(
      // Usamos MainAxisSize.min para que a Column ocupe apenas o espaço 
      // necessário, o que é útil ao usar LayoutBuilder.
      mainAxisSize: MainAxisSize.min, 
      children: <Widget>[
        // 2. Usar LayoutBuilder para pegar as restrições de tamanho 
        //    (embora já tenhamos calculado com MediaQuery, o LayoutBuilder 
        //     é mais útil se o pai tiver restrições).
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Opcional: ajustar a largura máxima do Card com base nas 
            // restrições do pai, mas manter o limite percentual da tela.
            final finalCardWidth = constraints.hasBoundedWidth 
                ? constraints.maxWidth * 0.9 < responsiveCardWidth
                    ? constraints.maxWidth * 0.9 // Se o pai for menor, usa 90% dele
                    : responsiveCardWidth // Senão, usa o percentual da tela
                : responsiveCardWidth;

            return Card(
              elevation: 5,
              color: const Color.fromARGB(255, 255, 255, 255),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Color(0xffAE11BC), width: 1.0),
              ),
              child: Container(
                // Aplica as larguras e alturas responsivas calculadas
                width: finalCardWidth,
                height: responsiveCardHeight, 
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                  children: <Widget>[
                    // O `ElevatedButton.icon` já é razoavelmente responsivo 
                    // em termos de conteúdo, mas podemos usar percentuais 
                    // para o padding se necessário (aqui mantive valores fixos 
                    // para o padding interno, o que é comum).
                    ElevatedButton.icon(
                      onPressed: () {
                        // O ideal é passar 'dados: seusDadosDoBanco' com dados reais
                        PDFService.gerarPDF(
                          titulo: 'Título do Documento',
                          dados: {}, // dados: seusDadosDoBanco,
                          // Map com os dados
                        );
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text('Salvar em PDF'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        // Padding pode ser ajustado com base na altura/largura da tela
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.08, // Exemplo: 8% da largura da tela
                          vertical: screenSize.height * 0.02,  // Exemplo: 2% da altura da tela
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}