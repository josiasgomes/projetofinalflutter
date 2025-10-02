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
    final size = MediaQuery.of(context).size;
    final appBarHeight = preferredSize.height;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, // 4% of screen width
          vertical: 8.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent, // Simplified color
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 255, 255, 255),
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
              const SizedBox(width: 48), // Maintain spacing for alignment
            
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            CircleAvatar(
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=12'),
              radius: appBarHeight * 0.35, // 35% of the AppBar's height
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
}
