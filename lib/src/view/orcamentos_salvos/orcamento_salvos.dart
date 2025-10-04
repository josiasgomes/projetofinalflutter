import 'package:flutter/material.dart';
import 'package:myapp/src/core/database/orcamento_repository.dart';
import 'package:myapp/src/model/orcamento.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/card_orcamento.dart';
import 'package:myapp/widget/filtro_orcamentos.dart';
import 'package:myapp/widget/linha_icones.dart';

class OrcamentosSalvos extends StatelessWidget {
  const OrcamentosSalvos({super.key});

  @override
  Widget build(BuildContext context) {
    final OrcamentoRepository repository = OrcamentoRepository();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Orçamentos Salvos',
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        // 1. A Column agora organiza a tela verticalmente
        child: Column(
          children: [
            // Adicione aqui seus widgets de filtro e pesquisa
            // Ex: const FiltrandoOrcamentos(),
            // const SizedBox(height: 16),

            // 2. O Expanded diz para o StreamBuilder usar todo o espaço restante
            Expanded(
              child: StreamBuilder<List<Orcamento>>(
                stream: repository.getOrcamentoMap(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum orçamento encontrado.'));
                  }

                  final orcamentos = snapshot.data!;

                  // 3. O ListView.builder agora tem um tamanho limitado pelo Expanded
                  // e pode rolar independentemente do resto da tela.
                  return ListView.builder(
                    itemCount: orcamentos.length,
                    itemBuilder: (context, index) {
                      final orcamentoIndividual = orcamentos[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CardOrcamento(orcamento: orcamentoIndividual),
                      );
                    },
                  );
                },
              ),
            ),

            // Adicione aqui seus botões de ação, eles ficarão na parte de baixo
            const SizedBox(height: 16),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.0,
              runSpacing: 10.0,
              children: [
                LinhaIcones(label: "Salvar", icon: Icons.save),
                LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                LinhaIcones(label: "Gerar PDF", icon: Icons.picture_as_pdf)
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}

