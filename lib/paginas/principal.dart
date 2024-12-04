import 'package:booki/paginas/screens/biblioteca.dart';
import 'package:booki/paginas/screens/inicio.dart';
import 'package:booki/paginas/screens/perfil.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PrincipalPage(),
    );
  }
}

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booki',style: TextStyle(color: Colors.green[200]),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.person),
        color: Colors.green[200],
        iconSize: 28,)
      ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Inicio(),
          const Biblioteca(),
          const Perfil(),
          Container(
            color: Colors.white,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {});
          currentIndex = value;

          _pageController.jumpToPage(value);

          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        backgroundColor: const Color.fromARGB(255, 229, 233, 240),
        selectedItemColor: Colors.black,
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
