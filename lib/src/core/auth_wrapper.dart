import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
import 'package:myapp/src/core/authenticate.dart';
import "package:flutter/foundation.dart";
import 'package:myapp/src/view/materiais_e_servicos.dart';
import 'package:myapp/src/view/splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;

            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const SplashPage();
            } else if (snapshot.hasData) {
              widget = MateriaisEServicosPage();
            } else {
              widget = const Authenticate();
            }
          },
        );
      },
    );

    return Authenticate();
  }
}
