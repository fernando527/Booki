import 'package:flutter/material.dart';
import 'package:booki/models/libros.dart';

class LibrosPage extends StatelessWidget {
  final Libros libro;

  const LibrosPage({super.key, required this.libro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(libro.titulo),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Título: ${libro.titulo}', style: TextStyle(fontSize: 20)),
          Text('Autor: ${libro.autor}', style: TextStyle(fontSize: 18)),
          Text('Año: ${libro.anio}', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
