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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              CampoLabel(
                label: "Nome do cliente:",
                placeholder: "digite aqui...",
                controller: _nomeClienteController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Tipo de Serviço:",
                placeholder: "digite aqui...",
                controller: _tipoServicoController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Material:",
                placeholder: "digite aqui...",
                controller: _materialController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Observações:",
                placeholder: "digite aqui...",
                controller: _observacoesController,
              ),
              const SizedBox(height: 20),
              const Text(
                "OBS: Orçamento válido por 10 dias.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinhaIcones(label: "Salvar", icon: Icons.save),
                  LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}
