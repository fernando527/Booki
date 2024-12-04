import 'package:flutter/material.dart';
//aqui ira la pantalla de perfil y donde ademas podra crear mas libros

class Perfil extends StatelessWidget {
  const Perfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      children: [
        const SizedBox(height: 22,),
        const CircleAvatar(backgroundColor: Colors.blue,radius: 36),
        SizedBox(height: 22,),
        Text('You',style: TextStyle(fontSize: 22),),
        
        const SizedBox(height: 20,),

        Container(
          child: Row(
            children: [
              SizedBox(width: 10,),
              Text('Que nueva Historia tienes en mente?:')
            ],
          ),
        ),

      ],
     ),
    );
  }
}
