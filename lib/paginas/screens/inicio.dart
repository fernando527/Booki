import 'package:flutter/material.dart';
//aqui ira la pantalla principal o de inicio(donde se mostraran libros y la barra de busqueda)

class Inicio extends StatelessWidget {
  const Inicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [

        SizedBox(height: 12,),

        TextField(
        cursorColor: Colors.black,
      

         decoration:InputDecoration(
      label: Text('Buscador',
      style: TextStyle(
        
        color: Colors.cyan[200],
        fontWeight: FontWeight.bold,
        fontSize: 15
      ),
      ),

       border:const  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(400),
              )
      ),


       focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(500),
              )
       ),


      suffixIcon: Icon(Icons.search),
      suffixIconColor: Colors.green[200]

        ),
        )
       ]
      )

    );


  }
}
