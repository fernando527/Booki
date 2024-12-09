import 'package:booki/models/usuarios.dart';
import 'package:booki/paginas/configuracion.dart';
import 'package:booki/paginas/screens/biblioteca.dart';
import 'package:booki/paginas/screens/inicio.dart';
import 'package:booki/paginas/screens/perfil.dart';
import 'package:flutter/material.dart';

void main() => runApp(Principal(
  usuario: Usuarios(nombre: "Usuario", correo: "email@dominio.com"),
));

class Principal extends StatelessWidget {

  final Usuarios usuario;

  const Principal({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalPage(usuario: usuario),
    );
  }
}

class PrincipalPage extends StatefulWidget {
  final Usuarios usuario;

  const PrincipalPage({super.key, required this.usuario});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Booki',
        style: TextStyle(color: Colors.green[200],
          fontWeight: FontWeight.bold),
          ),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Configuracion(),
            ),
          );
        }, icon: Icon(Icons.settings),
        color: Colors.green[200],
        iconSize: 28,)
        ],
      ),
      body: PageView(
        
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [

        const SingleChildScrollView(
          
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4), child: Text(
                  "¿Que deseas leer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text(
                  "hoy?", style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 24,
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                Inicio(),
              ],
            ),
          ),

          const Biblioteca(),
           Perfil(usuario: widget.usuario),

          Container(
            color: Colors.white,
          ),
        ],

        
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 16,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;   
          });

          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        
        selectedItemColor: Color.fromARGB(200, 173, 230, 187),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
        unselectedItemColor: Colors.black,
        
        items: const [
          BottomNavigationBarItem(
            label: 'Principal',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            //icon: Icon(Icons.menu_book), //libro normal abierto
            icon: Icon(Icons.auto_stories), //libro pasando pagina
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
