import 'package:flutter/material.dart';
import 'package:booki/models/libros.dart';

class LibrosPage extends StatelessWidget {
  final Libros libro;

  const LibrosPage({super.key, required this.libro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            children: [

              Text(
              libro.titulo+" (${libro.anio})",
              style: TextStyle(fontSize: 20, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            Text( 'by: ${libro.autor}',
              style: TextStyle(
                fontSize: 14, ),
            ),
            ],

        ),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('Contenido del libro ')
        ],
      ),
    );
  }
}
