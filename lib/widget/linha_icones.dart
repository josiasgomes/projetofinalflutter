import 'package:flutter/material.dart';

class LinhaIcones extends StatelessWidget {
  final String label;
  final IconData icon;

  const LinhaIcones({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          color: const Color(0xff000000),
          iconSize: 50,
          onPressed: () {
            // Lógica do ícone quando pressionado
          },
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}