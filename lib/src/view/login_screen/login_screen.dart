// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
import 'package:myapp/src/core/theme/app_buttonStyle.dart';
import 'package:myapp/src/core/theme/app_textStyle.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback toggleView;

  const LoginScreen({required this.toggleView, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Cria os controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String errorMessage = '';

  // 2. Limpa os controladores quando o widget é descartado
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Função para simular o login
  void _login() async {
    // 3. Acessa os valores digitados usando os controladores
    final email = _emailController.text;
    final password = _passwordController.text;

    // Adicionar aqui a lógica real para validar e logar o usuário
    try {
      await authService.value.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Erro desconhecido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Text('OrçaPro', style: AppTextstyle.heading1),

                  const SizedBox(height: 32.0),  

                  Text('Identifique-se', style: AppTextstyle.heading2),

                  ],
                ),

                const SizedBox(height: 16.0),

                TextField(
                  // 4. Atribui o controlador ao campo de e-mail
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppButtonStyle.emailTextField,
                ),

                const SizedBox(height: 32.0),

                TextField(
                  // 5. Atribui o controlador ao campo de senha
                  controller: _passwordController,
                  obscureText: true,
                  decoration: AppButtonStyle.passwordTextField,
                ),

                const SizedBox(height: 32.0),

                if (errorMessage != '')
                  Text(errorMessage, style: const TextStyle(color: Colors.red)),

                ElevatedButton(
                  onPressed:
                      _login, // 6. Chama a função _login ao pressionar o botão
                  style: AppButtonStyle.elevattedButtonStandart,
                  child: Text('Login', style: AppTextstyle.clickableButton),
                ),

                TextButton(
                  onPressed: widget.toggleView,
                  child: Text("Não possui uma conta? Clique aqui"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
