import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(0, 0, 0, 0),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (automaticallyImplyLeading)
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
                onPressed: onBack ?? () => Navigator.of(context).pop(),
              )
            else
              const SizedBox(width: 48), // Maintain spacing
            Text(
              title,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
              radius: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
}
