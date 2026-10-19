
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoritos;

  const FavoritesScreen({
    super.key,
    required this.favoritos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus favoritos'),
      ),
      body: favoritos.isEmpty
          ? const Center(
              child: Text('Nenhum filme favorito ainda.'),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    title: Text(favoritos[index]),
                  ),
                );
              },
            ),
    );
  }
}
