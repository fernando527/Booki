import 'package:flutter/material.dart';

class LibrosPage extends StatelessWidget {
  const LibrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Aqui va el contenido de los libros'),
        ],
      ),
    );
  }
}