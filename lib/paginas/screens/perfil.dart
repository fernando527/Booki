import 'package:booki/models/usuarios.dart';
import 'package:booki/paginas/configuracion.dart';
import 'package:booki/paginas/historiasPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key, required Usuarios usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
               backgroundImage: AssetImage('assets/logo.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                "Usuario",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "guest@domain.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              
          
              const SizedBox(height: 30),
              
            const Text('¿Tienes una historia en mente? ¡Escríbela aquí!',
              style: TextStyle(fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
             
            const SizedBox(height: 22),
            
            Container(
              child: FloatingActionButton.extended(onPressed: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RedactarPage(),
                          ),
                        );
               }, 
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text('Escribir',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),   
                ),
                backgroundColor: Color.fromARGB(200, 173, 230, 187),
                extendedPadding: const EdgeInsets.symmetric(horizontal: 116, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),  
                ),        
               ),
             )
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
