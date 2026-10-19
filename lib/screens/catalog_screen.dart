
import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'add_film_screen.dart';

class CatalogScreen extends StatefulWidget {
  final bool temaEscuro;
  final VoidCallback alterarTema;

  const CatalogScreen({
    super.key,
    required this.temaEscuro,
    required this.alterarTema,
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<String> filmes = [
    'Vingadores',
    'Duna',
    'Harry Potter',
    'Obsessão',
    'Lego',
    'Invocação do Mal',
  ];

  final List<String> favoritos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de filmes'),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Meu catálogo',
                style: TextStyle(fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Catálogo'),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritesScreen(
                      favoritos: favoritos,
                    ),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Adicionar filme'),
              onTap: () async {
                Navigator.pop(context);

                final filme = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddFilmScreen(),
                  ),
                );

                if (filme != null && filme.isNotEmpty) {
                  setState(() {
                    filmes.add(filme);
                  });
                }
              },
            ),

            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Tema escuro'),
              value: widget.temaEscuro,
              onChanged: (_) => widget.alterarTema(),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filmes em destaque',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: filmes.length,
                itemBuilder: (context, index) {
                  final filme = filmes[index];
                  final favorito = favoritos.contains(filme);

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.movie),
                      title: Text(filme),
                      trailing: IconButton(
                        icon: Icon(
                          favorito
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            if (favorito) {
                              favoritos.remove(filme);
                            } else {
                              favoritos.add(filme);
                            }
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
