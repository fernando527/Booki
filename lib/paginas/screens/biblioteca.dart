import 'package:flutter/material.dart';
//aqui ira la pantalla biblioteca en la cual se guardaran los libros que se van a leer

class Biblioteca extends StatelessWidget {
  const Biblioteca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      children: [
    SizedBox(height: 20,),
    Text('Tus Libros',
    style: TextStyle(fontSize: 20,
    color: Colors.blueAccent
    ),),
    
    //aqui irian todos los libors guardados por el usuario 
    ////implementar cuando se haya creado la base en fire base
    
    //ListView.builder(),
    

      ],

     ),
    );
  }
}
