import 'package:flutter/material.dart';
import 'package:myapp/src/core/clientes_repositorydart';
import 'package:myapp/src/model/cliente.dart';
// Certifique-se de que os imports dos seus widgets personalizados estão corretos
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

// Mantenha o StatefulWidget e o State para gerenciar os controladores
class CadastroClientes extends StatefulWidget {
  const CadastroClientes({super.key});

  @override
  State<CadastroClientes> createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  // Define a largura máxima do formulário para telas grandes
  static const double _maxWidthForm = 600.0;

  // Cria os controladores para cada campo de texto
  final _nomeController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cepController = TextEditingController();
  final _cidadeController = TextEditingController();

  // Limpa os controladores quando o widget é descartado
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

  void _salvarCliente() async {
    //Lógica de salvar o cliente e enviar pro banco de dados nosql
    Cliente cliente = Cliente(
      name: _nomeController.text,
      cpf: int.tryParse(_cpfCnpjController.text) ?? 0,
      telefone: int.tryParse(_telefoneController.text) ?? 0,
      email: _emailController.text,
      endereco: _enderecoController.text,
      cep: int.tryParse(_cepController.text) ?? 0,
      cidade: _cidadeController.text,
    );

    await ClientesRepository.addCliente(cliente);

    // Limpar os campos após o salvamento
    _nomeController.clear();
    _cpfCnpjController.clear();
    _telefoneController.clear();
    _emailController.clear();
    _enderecoController.clear();
    _cepController.clear();
    _cidadeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastro de Clientes',
        automaticallyImplyLeading: true,
      ),
      // **1. USANDO LayoutBuilder PARA RESPONSIVIDADE HORIZONTAL**
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Captura a largura máxima disponível
          final double screenWidth = constraints.maxWidth;

          return Center(
            // **2. LIMITANDO A LARGURA EM TELAS GRANDES**
            // O formulário terá no máximo 600.0 de largura, centralizado,
            // ou a largura total da tela se for menor que 600.0.
            child: SizedBox(
              width: screenWidth > _maxWidthForm ? _maxWidthForm : screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    // **Campos do Formulário**
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
                    // Mantendo CEP e Cidade em coluna para máxima compatibilidade em celular
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

                    // **3. USANDO Wrap PARA BOTÕES RESPONSIVOS**
                    // O Wrap quebra os elementos para a próxima linha se não houver espaço suficiente,
                    // evitando o erro de "overflow" (elementos passando do limite da tela).
                    Wrap(
                      alignment: WrapAlignment
                          .center, // Centraliza os botões no container
                      spacing: 24.0, // Espaçamento horizontal entre os botões
                      runSpacing:
                          10.0, // Espaçamento vertical (ao quebrar a linha)
                      children: [
                        LinhaIcones(
                          label: "Salvar",
                          icon: Icons.save,
                          onPressed: _salvarCliente,
                        ),
                        LinhaIcones(label: "Cancelar", icon: Icons.cancel),
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
