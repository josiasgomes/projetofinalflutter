// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

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

  // 2. Limpa os controladores quando o widget é descartado
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Função para simular o login
  void _login() {
    // 3. Acessa os valores digitados usando os controladores
    final email = _emailController.text;
    final password = _passwordController.text;

    // Lógica de autenticação
    print('Email: $email');
    print('Senha: $password');
    // Adicionar aqui a lógica real para validar e logar o usuário
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
                Text("Login"),

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
                      _login, // 6. Chama a função _login ao pressionar o botão
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(200.0, 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
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
