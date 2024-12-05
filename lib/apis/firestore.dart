import 'package:cloud_firestore/cloud_firestore.dart';

class Libros {
  final String anio;
  final String titulo;
  final String autor;

  Libros({required this.anio, required this.titulo, required this.autor});
}
