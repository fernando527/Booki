import 'package:booki/models/libros.dart';
import 'package:booki/paginas/escribirPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookEditingPage extends StatefulWidget {
  final String title;
  final String description;

  BookEditingPage({required this.title, required this.description});

  @override
  State<BookEditingPage> createState() => _BookEditingPageState();
}

class _BookEditingPageState extends State<BookEditingPage> {
  final List<String> generos = [
    'Acción',
    'Aventura',
    'De todo',
    'Humor',
    'Ficción',
    'Historia corta',
    'Terror',
    'Misterio',
    'Romance',
    'Fantasía',
  ];

  String? selectedCategory;
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

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    bookContentController.dispose();
    super.dispose();
  }

  void _showCategoryModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: generos.map((category) {
            return ListTile(
              title: Text(category),
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
                Navigator.pop(context);
                _showCategorySnackBar();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showCategorySnackBar() {
    if (selectedCategory != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Categoría seleccionada: $selectedCategory'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _saveChanges() async {
    final updatedTitle = titleController.text;
    final updatedDescription = descriptionController.text;
    final bookContent = bookContentController.text;

    print('Título actualizado: $updatedTitle');
    print('Descripción actualizada: $updatedDescription');
    print('Categoría seleccionada: $selectedCategory');
    print('Contenido del libro: $bookContent');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cambios guardados con éxito'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _navigateToWritingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WritingPage(
          title: widget.title, description: widget.description, bookContentController: bookContentController, 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Editando: ${widget.title}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: Icon(Icons.save, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Agregar una portada'),
              SizedBox(height: 8),
              _buildImagePicker(),
              SizedBox(height: 20),
              _buildSectionTitle('Título'),
              SizedBox(height: 8),
              TextField(
                controller: titleController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
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
              _buildSectionTitle('Descripción'),
              SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: TextField(
                  controller: descriptionController,
                  maxLines: null,
                  expands: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Géneros'),
              SizedBox(height: 10),
              _buildCategoryRow(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToWritingPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(200, 173, 230, 187),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '¡Inicia a escribir!',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          ' *',
          style: TextStyle(
              color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: () {
        print('Agregar imágenes');
      },
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 173, 230, 187),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          Icons.add_circle_rounded,
          size: 30,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return Row(
      children: [
        if (selectedCategory != null)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.category, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  selectedCategory!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: _showCategoryModal,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(200, 173, 230, 187),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Géneros',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
