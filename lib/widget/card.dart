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
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          color: const Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Color(0xffAE11BC), width: 1.0),
          ),
          child: Container(
            width: 330,
            height: 150,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // **O ERRO ESTAVA AQUI: Faltava 'children: <Widget>['**
              // Adicionamos a propriedade 'children' para criar a lista de widgets
              children: <Widget>[ 
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // O ideal é passar 'dados: seusDadosDoBanco' com dados reais
                      PDFService.gerarPDF(
                        titulo: 'Título do Documento', 
                        dados: {},//dados: seusDadosDoBanco, 
                        // Map com os dados
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Salvar em PDF'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                ),
                // Adicione outros widgets filhos aqui, se necessário
              ],
            ),
          ),
        ),
      ],
    );
  }
}