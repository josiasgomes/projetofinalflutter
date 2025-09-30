// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
import 'package:myapp/src/core/theme/app_buttonStyle.dart';
import 'package:myapp/src/core/theme/app_textStyle.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback toggleView;

  const RegisterScreen({required this.toggleView, super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  void _register() async {
    // 3. Acessa os valores digitados usando os controladores
    final email = _emailController.text;
    final password = _passwordController.text;

    // lógica real para registrar o usuário

    try {
      await authService.value.register(email: email, password: password);
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png', width: 220.0, height: 220.0),

                    Text('Identifique-se', style: AppTextstyle.heading2),
                  ],
                ),

                const SizedBox(height: 10.0),

                TextField(
                  // 4. Atribui o controlador ao campo de e-mail
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
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
                      _register, // 6. Chama a registro _register ao pressionar o botão
                  style: AppButtonStyle.elevattedButtonStandart,
                  child: Text('Registrar-se', style: AppTextstyle.clickableButton),
                  ),
                  
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: widget.toggleView,
                      child: Text("Já possui uma conta? Clique aqui"),
                    ),
                    Text("Criar conta", style: AppTextstyle.subTitle1),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
