import 'package:booki/models/libros.dart';
import 'package:booki/paginas/edicionLibroPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RedactarPage extends StatelessWidget {
  RedactarPage({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Escribir",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              'Agrega una portada',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                print('agregar imagenes');
              },
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 173, 230, 187),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: Icon(
                  Icons.add_circle_rounded,
                  size: 30,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Titulo de la historia',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              cursorColor: Colors.grey,
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Escribe el título aquí...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Descripción',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              cursorColor: Colors.grey,
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Escribe una breve descripción de tu historia...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  String title = titleController.text;
                  String description = descriptionController.text;

                  if (title.isEmpty || description.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Complete todos los campos, porfavor'),
                      ),
                    );
                  } else {
                    final libro = Libros(
                        titulo: titleController.text,
                        descripcion: descriptionController.text);

                    final docRef = FirebaseFirestore.instance
                        .collection("libros")
                        .withConverter(
                            fromFirestore: Libros.fromFirestore,
                            toFirestore: (Libros libro, options) =>
                                libro.toFirestore());
                    await docRef.add(libro);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookEditingPage(
                          title: title,
                          description: description,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(200, 173, 230, 187),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
