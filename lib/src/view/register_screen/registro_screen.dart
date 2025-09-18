// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Registro"),

                const SizedBox(height: 16.0),

                TextField(
                  // 4. Atribui o controlador ao campo de e-mail
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                TextField(
                  // 5. Atribui o controlador ao campo de senha
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24.0),

                ElevatedButton(
                  onPressed:
                      _register, // 6. Chama a registro _register ao pressionar o botão
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.0, 60.0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Registrar-se',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                if (errorMessage != '')
                  Text(errorMessage, style: const TextStyle(color: Colors.red)),
                TextButton(
                  onPressed: widget.toggleView,
                  child: const Text("Já possui uma conta? Clique aqui"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
