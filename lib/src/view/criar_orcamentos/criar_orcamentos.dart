import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

class FazerOrcamentos extends StatefulWidget {
  const FazerOrcamentos({super.key});

  @override
  State<FazerOrcamentos> createState() => _FazerOrcamentosState();
}

class _FazerOrcamentosState extends State<FazerOrcamentos> {
  final _nomeClienteController = TextEditingController();
  final _tipoServicoController = TextEditingController();
  final _materialController = TextEditingController();
  final _observacoesController = TextEditingController();

  @override
  void dispose() {
    _nomeClienteController.dispose();
    _tipoServicoController.dispose();
    _materialController.dispose();
    _observacoesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Fazer Orçamentos',
        automaticallyImplyLeading: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double horizontalPadding = constraints.maxWidth * 0.05;
          final double verticalSpacing = constraints.maxHeight * 0.02;
          final double maxWidth = constraints.maxWidth > 600 ? 600 : constraints.maxWidth;

          return Center(
            child: Container(
              width: maxWidth,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: verticalSpacing * 2),
                    CampoLabel(
                      label: "Nome do cliente:",
                      placeholder: "digite aqui...",
                      controller: _nomeClienteController,
                    ),
                    SizedBox(height: verticalSpacing),
                    CampoLabel(
                      label: "Tipo de Serviço:",
                      placeholder: "digite aqui...",
                      controller: _tipoServicoController,
                    ),
                    SizedBox(height: verticalSpacing),
                    CampoLabel(
                      label: "Material:",
                      placeholder: "digite aqui...",
                      controller: _materialController,
                    ),
                    SizedBox(height: verticalSpacing),
                    // Campo de observações agora com 5 linhas
                    CampoLabel(
                      label: "Observações:",
                      placeholder: "digite aqui...",
                      controller: _observacoesController,
                      maxLines: 5,
                    ),
                    SizedBox(height: verticalSpacing * 1.5),
                    Text(
                      "OBS: Orçamento válido por 10 dias.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: verticalSpacing * 1.5),
                    Wrap(
                      spacing: 24.0, // Espaçamento horizontal
                      runSpacing: 10.0, // Espaçamento vertical
                      alignment: WrapAlignment.center,
                      children: const [
                        LinhaIcones(label: "Salvar", icon: Icons.save),
                        LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                      ],
                    ),
                    SizedBox(height: verticalSpacing * 2),
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
