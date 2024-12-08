import 'package:booki/paginas/editarPerfilPage.dart';
import 'package:booki/paginas/historiasPage.dart';
import 'package:flutter/material.dart';

class Configuracion extends StatelessWidget{
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 173, 230, 187),
        title: Text("Configuración", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 25),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_rounded),
            title: Text("Editar perfil"),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => EditProfilePage())
              );
            },
          ),

          Divider(indent: 20, endIndent: 20),
          
          const ListTile(
            title: Text("Modo de apariencia"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Modo Claro"),
                SizedBox(width: 8),
                Icon(Icons.brightness_6)
              ],
            ),
          ),

          Divider(indent: 20, endIndent: 20),

          const ListTile(
            title: Text("Idioma"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Español"),
                SizedBox(width: 8),
                Icon(Icons.language)
              ],
            ),
          ),
        ],
      ),
    );
  }
}