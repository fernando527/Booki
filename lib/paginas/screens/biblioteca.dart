import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booki/models/libros.dart';
import 'package:booki/paginas/libros.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  final Stream<QuerySnapshot> _librosStream =
      FirebaseFirestore.instance.collection('libros').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _librosStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Algo salio mal');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            Libros libro = Libros(
              imagenURL: '',
              //anio: data['anio'] ?? 'Desconocido',
              titulo: data['titulo'] ?? 'Sin título',
              autor: data['autor'] ?? 'Anónimo',
              descripcion: data['descripcion'],
            );

            return ListTile(
              title: Text(libro.titulo),
              subtitle: Text(libro.autor!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibrosPage(libro: libro),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
