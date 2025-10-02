import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/card.dart';
import 'package:myapp/widget/filtro_orcamentos.dart';
import 'package:myapp/widget/linha_icones.dart';

class OrcamentosSalvos extends StatelessWidget {
  const OrcamentosSalvos({super.key});

  // Largura máxima para o conteúdo principal em telas grandes
  static const double _maxWidthContent = 700.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Orçamentos Salvos',
        automaticallyImplyLeading: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeScreen = constraints.maxWidth > _maxWidthContent;
          final double horizontalPadding = constraints.maxWidth * 0.04;
          final double verticalSpacing = constraints.maxHeight * 0.025;

          return Center(
            child: Container(
              width: isLargeScreen ? _maxWidthContent : constraints.maxWidth,
              child: CustomScrollView(
                slivers: [
                  // 1. Espaçador no topo
                  SliverToBoxAdapter(
                    child: SizedBox(height: verticalSpacing),
                  ),
                  // 2. Campo de pesquisa
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    sliver: SliverToBoxAdapter(
                      child: _buildSearchField(context, constraints),
                    ),
                  ),
                  // 3. Espaçador
                  SliverToBoxAdapter(
                    child: SizedBox(height: verticalSpacing),
                  ),
                  // 4. Filtros
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    sliver: const SliverToBoxAdapter(
                      child: FiltrandoOrcamentos(),
                    ),
                  ),
                  // 5. Espaçador
                  SliverToBoxAdapter(
                    child: SizedBox(height: verticalSpacing),
                  ),
                  // 6. Lista de Orçamentos
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    sliver: _buildBudgetList(),
                  ),
                  // 7. Espaçador
                  SliverToBoxAdapter(
                    child: SizedBox(height: verticalSpacing),
                  ),
                  // 8. Botões de ação
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    sliver: SliverToBoxAdapter(
                      child: _buildActionButtons(),
                    ),
                  ),
                  // 9. Espaçador na base
                  SliverToBoxAdapter(
                    child: SizedBox(height: verticalSpacing),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }

  // Widget para o campo de pesquisa
  Widget _buildSearchField(BuildContext context, BoxConstraints constraints) {
    return TextField(
      decoration: InputDecoration(
        hintText: "pesquisar...",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.05,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
     
      ),
    );
  }

  // Widget para a lista de orçamentos (agora usando SliverList)
  Widget _buildBudgetList() {
    return SliverList.builder(
      itemCount: 3, // Simula 3 orçamentos
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8.0), // Espaço entre os cards
          child: CardOrcamento(),
        );
      },
    );
  }

  // Widget para os botões de ação
  Widget _buildActionButtons() {
    return const Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0, // Espaço horizontal
      runSpacing: 10.0, // Espaço vertical
      children: [
        LinhaIcones(label: "Salvar", icon: Icons.save),
        LinhaIcones(label: "Cancelar", icon: Icons.cancel),
        LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf),
      ],
    );
  }
}
