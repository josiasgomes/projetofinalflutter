import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/src/core/auth_wrapper.dart';
import 'package:myapp/src/view/CadastroClientes/cadastro_clientes.dart';
import 'package:myapp/src/view/materiais_e_servicos/materiais_e_servicos.dart';
import 'package:myapp/src/view/menu_screen/menu_screen.dart';
import 'package:myapp/src/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthWrapper());
  }
}
