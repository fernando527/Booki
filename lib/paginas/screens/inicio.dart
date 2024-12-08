import 'package:flutter/material.dart';
//aqui ira la pantalla principal o de inicio(donde se mostraran libros y la barra de busqueda)

class Inicio extends StatelessWidget {
  const Inicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        
        children: [
          SizedBox(height: 12),

          TextField(
            cursorColor: Colors.black,
            decoration:InputDecoration(

              label: Text('Buscar historias',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15
                ),
              ),

              border:const  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),


              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),


              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.black,
              ),
          ),
        ]
        
      )
      
    );
    
  }
}
