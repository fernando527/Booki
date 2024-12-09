import 'package:cloud_firestore/cloud_firestore.dart';

class Libros {
  final String? anio;
  final String titulo;
  final String? autor;
  final String descripcion;
  final String? imagenURL;
  Libros(this.imagenURL,
      {this.anio, required this.titulo, this.autor, required this.descripcion});

  factory Libros.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Libros(
        anio: data?['anio'],
        titulo: data?['titulo'],
        autor: data?['autor'],
        descripcion: data?['descripcion']);
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (anio != null) "anio": anio,
      if (titulo != null) "titulo": titulo,
      if (autor != null) "nombre": autor,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
