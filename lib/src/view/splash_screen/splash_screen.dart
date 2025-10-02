import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth/auth_wrapper.dart';
import 'package:myapp/src/view/Login/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Inicia um temporizador de 3 segundos (ou o tempo que desejar)
    // Em lib/src/view/splash_screen.dart
    Future.delayed(const Duration(seconds: 3), () {
      // VERIFICA SE O WIDGET AINDA ESTÁ NA TELA ANTES DE NAVEGAR
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthWrapper()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco como na imagem
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logomarca do aplicativo
            Image.asset(
              'assets/logo.png', // Verifique se o caminho está correto
              height: 150, // Altura ajustada para ser similar à imagem
            ),
            const SizedBox(
              height: 10,
            ), // Pequeno espaço entre a imagem e o texto
            // Texto "OrçaPro" estilizado
          ],
        ),
      ),
    );
  }
}
