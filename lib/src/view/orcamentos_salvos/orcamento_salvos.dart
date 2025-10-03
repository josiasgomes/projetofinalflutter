import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/card.dart';
import 'package:myapp/widget/filtro_orcamentos.dart';
import 'package:myapp/widget/linha_icones.dart';

class OrcamentosSalvos extends StatelessWidget {
  const OrcamentosSalvos({super.key});

  // Define a largura máxima ideal para o conteúdo principal,
  // ou um percentual dela, mantendo o valor fixo como referência
  // para telas muito grandes (ex: desktops/tablets)
  static const double _maxWidthContent = 700.0;
  
  // Percentuais de altura para espaçamento (SizedBox)
  static const double _spacingPercent1 = 0.02; // Ex: 2% da altura da tela
  static const double _spacingPercent2 = 0.01; // Ex: 1% da altura da tela
  static const double _spacingPercent3 = 0.04; // Ex: 4% da altura da tela

  @override
  Widget build(BuildContext context) {
    // Acessa as dimensões totais da tela via MediaQuery
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    
    // Calcula os espaçamentos com base no percentual da altura da tela
    final double spacing1 = screenHeight * _spacingPercent1; // Ex: 2% da altura
    final double spacing2 = screenHeight * _spacingPercent2; // Ex: 1% da altura
    final double spacing3 = screenHeight * _spacingPercent3; // Ex: 4% da altura
    final double spacingSmall = screenHeight * 0.008; // Espaço menor, ~0.8%

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Orçamentos Salvos',
        automaticallyImplyLeading: true, // Mantém o botão de voltar padrão
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          // Se a largura disponível (constraints.maxWidth) for maior que a largura ideal,
          // limitamos o conteúdo.
          final bool isLargeScreen = screenWidth > _maxWidthContent;
          
          // Define a largura do SizedBox. Se for tela grande, usa a largura ideal.
          // Se for tela pequena, usa 100% da largura disponível (screenWidth).
          final double contentWidth = isLargeScreen ? _maxWidthContent : screenWidth;

          return Center(
            // Limita a largura do conteúdo principal
            child: SizedBox(
              width: contentWidth,
              child: Padding(
                // Usa percentual da largura da tela para padding lateral em telas menores,
                // ou um valor fixo em telas grandes para evitar padding muito grande.
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 16.0 : screenWidth * 0.04, // Ex: 4% da largura
                  vertical: 16.0,
                ),
                child: ListView(
                  children: [
                    // Espaçamento com base em percentual da altura da tela
                    SizedBox(height: spacing1), 
                    
                    // Lista de Cards
                    const CardOrcamento(),
                    SizedBox(height: spacingSmall), // Espaçamento menor
                    const CardOrcamento(),
                    SizedBox(height: spacingSmall),
                    const CardOrcamento(),
                    SizedBox(height: spacingSmall),

                    SizedBox(height: spacing2),
                    
                    // Botões de Ação Responsivos
                    // O Wrap já é inerentemente responsivo, usando o constraints.maxWidth
                    // do SizedBox pai para decidir a quebra de linha.
                    const Wrap(
                      alignment: WrapAlignment.center, // Centraliza os botões
                      spacing: 20.0, // Espaço horizontal entre os itens (pode ser ajustado por percentual aqui se necessário)
                      runSpacing: 10.0, // Espaço vertical (quando quebra a linha)
                      children: [
                        LinhaIcones(label: "Salvar", icon: Icons.save),
                        LinhaIcones(label: "Cancelar", icon: Icons.cancel)
                        //LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
                      ],
                    ),
                    
                    // Espaçamento maior no final
                    SizedBox(height: spacing3),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}