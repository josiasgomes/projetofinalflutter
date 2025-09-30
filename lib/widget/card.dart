import 'package:flutter/material.dart';

class CardOrcamento extends StatefulWidget {
  const CardOrcamento({Key? key}) : super(key: key);

  @override
  _CardOrcamentoState createState() => _CardOrcamentoState();
}

class _CardOrcamentoState extends State<CardOrcamento> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          color: const Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Color(0xffAE11BC), width: 1.0),
          ),
          child: Container(
            width: 330,
            height: 150,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Adicione o conteúdo do Card aqui.

              // Adicione os widgets filhos aqui
            ),
          ),
        ),
      ],
    );
  }
}






