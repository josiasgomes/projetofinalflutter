import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/database/orcamento_repository.dart';
import 'package:myapp/src/model/orcamento.dart';
import 'package:myapp/widget/salvar_pdf.dart';

class CardOrcamento extends StatelessWidget {
  final Orcamento orcamento;
  const CardOrcamento({super.key, required this.orcamento});

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
              children: <Widget>[
                //Informações orçamento
                Text('Nome: ${orcamento.name}'),
                Text('Tipo de serviço: ${orcamento.tipoDeServico}'),
                Text('Material: ${orcamento.material}'),
                Text('Quantidade: ${orcamento.quantidade}'),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // O ideal é passar 'dados: seusDadosDoBanco' com dados reais
                      PDFService.gerarPDF(
                        titulo: 'Título do Documento',
                        dados: {}, //dados: seusDadosDoBanco,
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
