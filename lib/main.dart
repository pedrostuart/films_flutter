import 'package:flutter/material.dart';
import 'package:flutter_films/screens/catalog_screen.dart';

void main() {
  runApp(const Myapp());
}
class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmes',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),

      home: CatalogScreen(),
    );
    
  }
}

