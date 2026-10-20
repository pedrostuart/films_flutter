import 'package:flutter/material.dart';
import 'package:flutter_films/screens/catalog_screen.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool temaEscuro = false;

  void alterarTema() {
    setState(() {
      temaEscuro = !temaEscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmes',
      themeMode: temaEscuro ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: CatalogScreen(
        temaEscuro: temaEscuro,
        alterarTema: alterarTema,
      ),
    );
  }
}
