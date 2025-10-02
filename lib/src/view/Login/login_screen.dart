
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth/auth_service.dart';
import 'package:myapp/src/core/theme/app_button_style.dart';
import 'package:myapp/src/core/theme/app_text_style.dart';

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
      if (mounted) {
        setState(() {
          errorMessage = e.message ?? 'Erro desconhecido';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // Use SingleChildScrollView to avoid overflow when keyboard appears
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          // Ensure the container takes at least the full screen height
          constraints: BoxConstraints(minHeight: size.height),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Make the image responsive
              Image.asset(
                'assets/logo.png',
                width: size.width * 0.5, // 50% of screen width
                height: size.width * 0.5,
              ),
              
              Text(
                'Identifique-se', 
                style: AppTextstyle.heading2, 
                textAlign: TextAlign.center
              ),

              // Use a fraction of the screen height for spacing
              SizedBox(height: size.height * 0.04),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: AppButtonStyle.textFieldDecoration(hint: 'Email'),
              ),

              SizedBox(height: size.height * 0.02),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: AppButtonStyle.textFieldDecoration(hint: 'Senha'),
              ),

              SizedBox(height: size.height * 0.03),

              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),

              ElevatedButton(
                onPressed: _login,
                style: AppButtonStyle.elevattedButtonStandart,
                child: Text('Login', style: AppTextstyle.clickableButton),
              ),

              SizedBox(height: size.height * 0.02),

              TextButton(
                onPressed: widget.toggleView,
                child: const Text("Não possui uma conta? Clique aqui"),
              ),
              Text(
                "Menu de login", 
                style: AppTextstyle.subTitle1, 
                textAlign: TextAlign.center
              ),
            ],
          ),
        ),
      ),
    );
  }
}
