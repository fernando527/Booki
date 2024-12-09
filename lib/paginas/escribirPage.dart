import 'package:flutter/material.dart';

class WritingPage extends StatefulWidget {
  final String title;
  final String description;
  final TextEditingController bookContentController;

  WritingPage({
    required this.title, 
    required this.description,
    required this.bookContentController,
    });
  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late TextEditingController contentController;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController bookContentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    bookContentController = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Escribir Libro'),
      ),
      body: Padding(
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
                    color: Colors.black, width: 2,
                  )
                ),
          ),
        ),
      ),
    );
  }
}