

import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 173, 230, 187),
        title: Text('Editar Perfil', style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 25),

            TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'Nombre',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black, width: 2,)
                ),
              ),
            ),
            
            const SizedBox(height: 25),

            TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black, width: 2,)
                ),
              ),
            ),

            const SizedBox(height: 25),
            
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);  
                },
                
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(200, 173, 230, 187),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),
                ),
                  child: const Text('Guardar Cambios',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}