import 'package:booki/models/libros.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuarios {
  //final String usuario_id;
  final String correo;
  final String nombre;
  List<Libros>? listaFavoritos = [];

  Usuarios({required this.correo, required this.nombre, this.listaFavoritos});

  factory Usuarios.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Usuarios(
      correo: data?['correo'],
      listaFavoritos: data?['listaFavoritos'] is Iterable
          ? List.from(data?['listaFavoritos'])
          : null,
      nombre: data?['nombre'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (correo != null) "correo": correo,
      if (listaFavoritos != null) "listaFavoritos": listaFavoritos,
      if (nombre != null) "nombre": nombre,
    };
  }
}
