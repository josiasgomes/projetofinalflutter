import 'package:flutter/material.dart';
import 'package:myapp/src/core/auth_service.dart';
import 'package:myapp/src/core/authenticate.dart';
import 'package:myapp/src/view/materiais_e_servicos/materiais_e_servicos.dart';
import 'package:myapp/src/view/menu_screen/menu_screen.dart';
import 'package:myapp/src/view/splash_screen/splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;

            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const SplashPage();
            } else if (snapshot.hasData) {
              widget = const MenuScreen();
            } else {
              widget = const Authenticate();
            }

            return widget;
          },
        );
      },
    );
  }
}
