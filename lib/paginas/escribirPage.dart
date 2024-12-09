import 'package:flutter/material.dart';

class WritingPage extends StatelessWidget {
  final TextEditingController controller;

  WritingPage({required this.controller});

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
          controller: controller,
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