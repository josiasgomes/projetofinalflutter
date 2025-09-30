import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

// 1. Convertido para StatefulWidget
class CadastroClientes extends StatefulWidget {
  const CadastroClientes({super.key});

  @override
  State<CadastroClientes> createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  // 2. Cria os controladores para cada campo de texto
  final _nomeController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cepController = TextEditingController();
  final _cidadeController = TextEditingController();

  // 3. Limpa os controladores quando o widget é descartado
  @override
  void dispose() {
    _nomeController.dispose();
    _cpfCnpjController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _enderecoController.dispose();
    _cepController.dispose();
    _cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastro de Clientes',
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              // 4. Associa os controladores aos seus respectivos campos
              CampoLabel(
                label: "Nome completo:",
                placeholder: "digite aqui...",
                controller: _nomeController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "CPF/CNPJ:",
                placeholder: "digite aqui...",
                controller: _cpfCnpjController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Telefone:",
                placeholder: "digite aqui...",
                controller: _telefoneController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Email:",
                placeholder: "digite aqui...",
                controller: _emailController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Endereço:",
                placeholder: "digite aqui...",
                controller: _enderecoController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "CEP:",
                placeholder: "digite aqui...",
                controller: _cepController,
              ),
              const SizedBox(height: 8),
              CampoLabel(
                label: "Cidade:",
                placeholder: "digite aqui...",
                controller: _cidadeController,
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
