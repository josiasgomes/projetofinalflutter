import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/linha_icones.dart';

class MateriaisEServicosPage extends StatefulWidget {
  const MateriaisEServicosPage({super.key});

  @override
  State<MateriaisEServicosPage> createState() => _MateriaisEServicosPageState();
}

class _MateriaisEServicosPageState extends State<MateriaisEServicosPage> {
  final _materiaisController = TextEditingController();
  final _servicosController = TextEditingController();

  @override
  void dispose() {
    _materiaisController.dispose();
    _servicosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Acessa o tamanho da tela para possíveis ajustes de layout/tamanho de fonte
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Materiais e Serviços',
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        // Usa um layout horizontal para telas mais largas
        final bool useHorizontalLayout = constraints.maxWidth > 600;
        final double spacing = constraints.maxWidth * 0.04;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(spacing),
            child: useHorizontalLayout
                ? _buildHorizontalLayout(spacing)
                : _buildVerticalLayout(spacing),
          ),
        );
      }),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }

  Widget _buildVerticalLayout(double spacing) {
    return Column(
      children: [
        _buildTextField(
          label: 'Materiais:',
          hint: 'Cadastre aqui seus materiais',
          controller: _materiaisController,
        ),
        SizedBox(height: spacing),
        _buildTextField(
          label: 'Serviços:',
          hint: 'Cadastre aqui seus serviços',
          controller: _servicosController,
        ),
        SizedBox(height: spacing * 1.5),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildHorizontalLayout(double spacing) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildTextField(
                label: 'Materiais:',
                hint: 'Cadastre aqui seus materiais',
                controller: _materiaisController,
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: _buildTextField(
                label: 'Serviços:',
                hint: 'Cadastre aqui seus serviços',
                controller: _servicosController,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing * 1.5),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black.withOpacity(0.1))],
          ),
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: controller,
            maxLines: 6, // Aumenta o número de linhas para melhor visualização
            decoration: InputDecoration.collapsed(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return const Wrap(
      alignment: WrapAlignment.center,
      spacing: 24.0,
      runSpacing: 10.0,
      children: [
        LinhaIcones(label: "Salvar", icon: Icons.save),
        LinhaIcones(label: "Cancelar", icon: Icons.cancel),
      ],
    );
  }
}