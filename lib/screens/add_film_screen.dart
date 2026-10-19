
import 'package:flutter/material.dart';

class AddFilmScreen extends StatefulWidget {
  const AddFilmScreen({super.key});

  @override
  State<AddFilmScreen> createState() => _AddFilmScreenState();
}

class _AddFilmScreenState extends State<AddFilmScreen> {
  final TextEditingController filmeController =
      TextEditingController();

  @override
  void dispose() {
    filmeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: filmeController,
              decoration: const InputDecoration(
                labelText: 'Nome do filme',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                final nome = filmeController.text.trim();

                if (nome.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Digite o nome do filme.'),
                    ),
                  );
                  return;
                }

                Navigator.pop(context, nome);
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
