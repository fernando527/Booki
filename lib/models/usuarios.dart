import 'package:booki/models/libros.dart';

class Usuarios {
  final String usuario_id;
  final String correo;
  final String nombre;
  final List<Libros> listaFavoritos;

  Usuarios(
      {required this.usuario_id,
      required this.correo,
      required this.nombre,
      required this.listaFavoritos});
}
