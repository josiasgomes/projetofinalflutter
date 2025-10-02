import 'package:flutter/material.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Clientes',
        automaticallyImplyLeading: true, // No back button on this screen
      ),
      body: ListView.builder(
        itemCount: 6, // This number will be dynamic, coming from the database
        itemBuilder: (context, index) {
          return Padding(
            // Use a fraction of the screen width for horizontal padding
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, // 4% of screen width
              vertical: 8.0, // Vertical padding can often remain fixed
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                // Use responsive padding inside the ListTile as well
                contentPadding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, // 5% of screen width
                  vertical: 10,
                ),
                title: Text(
                  'Cliente ${index + 1}', // This text will be the client's name
                  // Use theme-based text styles for responsiveness
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Action when clicking on the client (e.g., go to client details screen)
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BarraNavegacaoPrincipal(),
    );
  }
}
