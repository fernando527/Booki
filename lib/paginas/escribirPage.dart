import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WritingPage extends StatefulWidget {
  final String title;
  final String description;
  final TextEditingController bookContentController;
  final String? book_id;

  WritingPage(
      {required this.title,
      required this.description,
      required this.bookContentController,
      this.book_id});
  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late TextEditingController contentController;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController bookContentController;
  late String book_id;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    bookContentController = TextEditingController();
    book_id = widget.book_id as String;
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    bookContentController.dispose();
    super.dispose();
  }

  void _saveContent() {
    final title = titleController.text;
    final description = descriptionController.text;
    final content = bookContentController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final db = FirebaseFirestore.instance;
            final libroCreadoRef = db.collection("libros").doc(book_id);
            libroCreadoRef.update({"body": bookContentController.text}).then(
                (value) => {print("Documento actualizado")},
                onError: (e) => print("Error al actualizar documento $e"));
          }),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Escribir Libro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                cursorColor: Colors.grey,
                controller: bookContentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Escribe tu libro aquí...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
