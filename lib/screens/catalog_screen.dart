import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget{
  const CatalogScreen({super.key});

  final List<String> produtos = const [
    'Vingadores',
    'Duna',
    'Harry Potter',
    'Obsessão',
    'Lego',
    'Invocação do Mal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filmes em destaque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12,),

            SizedBox(
              height: 120,

              child: ListView.builder(),
            )
          ],
        ),
      
      ),

    );
    
  }
}