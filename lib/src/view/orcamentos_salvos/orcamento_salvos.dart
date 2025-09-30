import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/card.dart';
import 'package:myapp/widget/filtro_orcamentos.dart';
import 'package:myapp/widget/linha_icones.dart';

class OrcamentosSalvos extends StatelessWidget {
  const OrcamentosSalvos({super.key});

  // Define a largura máxima ideal para o conteúdo principal
  static const double _maxWidthContent = 700.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Orçamentos Salvos',
        automaticallyImplyLeading: true, // Mantém o botão de voltar padrão
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isLargeScreen = screenWidth > _maxWidthContent;

          return Center(
            // Limita a largura do conteúdo principal em telas grandes
            child: SizedBox(
              width: isLargeScreen ? _maxWidthContent : screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    // Área de Pesquisa
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Faz o conteúdo (TextField) esticar
                      children: [
                        // O Text está vazio no código original, mas foi mantido aqui
                        const Text(
                          "",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 6),
                        // O Container do TextField agora usa largura máxima disponível
                        Container(
                          // Removida a largura fixa de 330 para usar toda a largura disponível (stretch)
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
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none, // O container já tem a decoração de sombra
                              ),
                              labelText: "pesquisar...",
                              labelStyle: const TextStyle(color: Color(0xffC0C0C0)),
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Color(0xffAE11BC),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16), // Aumentei o espaçamento para clareza

                    const FiltrandoOrcamentos(),

                    const SizedBox(height: 16),

                    // Lista de Cards
                    const CardOrcamento(),
                    const SizedBox(height: 8),
                    const CardOrcamento(),
                    const SizedBox(height: 8),
                    const CardOrcamento(),
                    const SizedBox(height: 8),

                    const SizedBox(height: 20),

                    // Botões de Ação Responsivos
                    // Usa Wrap para quebrar a linha se a tela for muito estreita
                    const Wrap(
                      alignment: WrapAlignment.center, // Centraliza os botões
                      spacing: 20.0, // Espaço horizontal entre os itens
                      runSpacing: 10.0, // Espaço vertical (quando quebra a linha)
                      children: [
                        LinhaIcones(label: "Salvar", icon: Icons.save),
                        LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                        LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
                      ],
                    ),
                    const SizedBox(height: 30),
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