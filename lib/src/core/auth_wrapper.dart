import 'package:flutter/material.dart';
import 'package:myapp/src/core/authenticate.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}
