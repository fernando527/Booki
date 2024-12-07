import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booki/apis/firestore.dart';

//aqui ira la pantalla biblioteca en la cual se guardaran los libros que se van a leer

class Biblioteca extends StatefulWidget {
  const Biblioteca({
    super.key,
  });

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

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator()
              ],
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['titulo']),
                  subtitle: Text(data['autor']),
                );
              })
              .toList()
              .cast(),

        );
      },
    );
  }
}
