import 'package:flutter/material.dart';
import 'package:myapp/src/core/database/orcamento_repository.dart';
import 'package:myapp/src/core/theme/app_text_style.dart';
import 'package:myapp/src/model/orcamento.dart';
import 'package:myapp/widget/salvar_pdf.dart';

class CardOrcamento extends StatelessWidget {
  final Orcamento orcamento;

  const CardOrcamento({super.key, required this.orcamento});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final largura = size.width;
    final altura = size.height;

    // Responsividade ajustada com base no tamanho da tela
    final bool telaPequena = largura < 600;
    final bool telaMedia = largura >= 600 && largura < 1000;

    // Define tamanhos proporcionais
    final cardWidth = telaPequena
        ? largura * 0.9
        : telaMedia
            ? largura * 0.6
            : largura * 0.4;

    final cardPadding = telaPequena ? 12.0 : 16.0;
    final fonte = telaPequena ? 14.0 : 16.0;

    return Center(
      child: Card(
        elevation: 4,
        color: Colors.white,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xffAE11BC), width: 1),
        ),
        child: Container(
          width: cardWidth,
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 🧾 Título
              Text(
                'Orçamento',
                style: TextStyle(
                  fontSize: fonte + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffAE11BC),
                ),
              ),
              const SizedBox(height: 10),

              // ℹ️ Informações do orçamento
              _buildInfoRow('Nome', orcamento.name, fonte),
              _buildInfoRow('Tipo de serviço', orcamento.tipoDeServico, fonte),
              _buildInfoRow('Material', orcamento.material, fonte),
              _buildInfoRow('Quantidade', orcamento.quantidade.toString(), fonte),

              const SizedBox(height: 20),

              // 📄 Botão PDF
              Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    PDFService.gerarPDF(
                      titulo: 'Título do Documento',
                      dados: {}, // Substitua pelos dados reais
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Salvar em PDF'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffAE11BC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: telaPequena ? 20 : 30,
                      vertical: telaPequena ? 10 : 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔧 Método auxiliar para gerar uma linha de texto informativo
  Widget _buildInfoRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          text: '$label: ',
          style: AppTextstyle.textSmall1,
          children: [
            TextSpan(
              text: value,
              style: AppTextstyle.textSmall1),
          ],
        ),
      ),
    );
  }
}

