import 'package:flutter/material.dart';
import 'package:myapp/src/core/clientes_repository.dart';
import 'package:myapp/src/model/cliente.dart';
// Certifique-se de que os imports dos seus widgets personalizados estão corretos
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:myapp/widget/campo_label.dart';
import 'package:myapp/widget/linha_icones.dart';

class CadastroClientes extends StatefulWidget {
  const CadastroClientes({super.key});

  @override
  State<CadastroClientes> createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  // Controladores para os campos de texto
  final _nomeController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cepController = TextEditingController();
  final _cidadeController = TextEditingController();

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
    try {
      await clientesRepository.addCliente(cliente.toMap());

      // Mostra um feedback de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cliente salvo com sucesso!')),
      );

      // Limpa os campos após o salvamento bem-sucedido
      _nomeController.clear();
      _cpfCnpjController.clear();
      _telefoneController.clear();
      _emailController.clear();
      _enderecoController.clear();
      _cepController.clear();
      _cidadeController.clear();
    } catch (e) {
      // Mostra um feedback de erro caso algo dê errado
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao salvar cliente: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastro de Clientes',
        automaticallyImplyLeading: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Usar um breakpoint para decidir o layout
          bool useHorizontalLayout = constraints.maxWidth > 600;
          
          // Padding e espaçamento responsivos
          final double horizontalPadding = constraints.maxWidth * 0.05;
          final double verticalSpacing = constraints.maxHeight * 0.015;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  SizedBox(height: verticalSpacing * 2),
                  CampoLabel(
                    label: "Nome completo:",
                    placeholder: "digite aqui...",
                    controller: _nomeController,
                  ),
                  SizedBox(height: verticalSpacing),
                  CampoLabel(
                    label: "CPF/CNPJ:",
                    placeholder: "digite aqui...",
                    controller: _cpfCnpjController,
                  ),
                  SizedBox(height: verticalSpacing),
                  CampoLabel(
                    label: "Telefone:",
                    placeholder: "digite aqui...",
                    controller: _telefoneController,
                  ),
                  SizedBox(height: verticalSpacing),
                  CampoLabel(
                    label: "Email:",
                    placeholder: "digite aqui...",
                    controller: _emailController,
                  ),
                  SizedBox(height: verticalSpacing),
                  CampoLabel(
                    label: "Endereço:",
                    placeholder: "digite aqui...",
                    controller: _enderecoController,
                  ),
                  SizedBox(height: verticalSpacing),
                  
                  // Layout condicional para CEP e Cidade
                  useHorizontalLayout
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CampoLabel(
                                label: "CEP:",
                                placeholder: "digite aqui...",
                                controller: _cepController,
                              ),
                            ),
                            SizedBox(width: verticalSpacing),
                            Expanded(
                              child: CampoLabel(
                                label: "Cidade:",
                                placeholder: "digite aqui...",
                                controller: _cidadeController,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CampoLabel(
                              label: "CEP:",
                              placeholder: "digite aqui...",
                              controller: _cepController,
                            ),
                            SizedBox(height: verticalSpacing),
                            CampoLabel(
                              label: "Cidade:",
                              placeholder: "digite aqui...",
                              controller: _cidadeController,
                            ),
                          ],
                        ),

                  SizedBox(height: verticalSpacing * 2.5),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24.0, 
                    runSpacing: 10.0,
                    children: const [
                      LinhaIcones(label: "Salvar", icon: Icons.save),
                      LinhaIcones(label: "Cancelar", icon: Icons.cancel),
                    ],
                  ),
                  SizedBox(height: verticalSpacing * 2.5),
                ],
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
            
          );
        },
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}
