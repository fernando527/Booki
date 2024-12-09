import 'package:booki/models/usuarios.dart';
import 'package:booki/paginas/principal.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ooops !!',
        style: TextStyle(
          color: const Color.fromARGB(255, 226, 9, 9),
          fontWeight: FontWeight.bold,
          fontSize: 28
          
        ),

        ),
          ],
        ),
        SizedBox(height: 22,),

       SizedBox(height: 250, child: Image.asset('assets/error.jpg')),
       SizedBox(height: 22,),

       Row(mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Text('La pagina a la cual intentas ingresar no esta disponible en estos momentos :(',
        style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.bold),),
        
       ],
       ),

        SizedBox(height: 22,),


       FloatingActionButton.extended(onPressed: (){
                Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Principal(),
                          ),
                        );
               }, 
                icon: Icon(Icons.reset_tv_rounded, color: Colors.white),
                label: Text('Regresar',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),   
                ),
                backgroundColor:const Color.fromARGB(255, 239, 93, 83),
                extendedPadding: const EdgeInsets.symmetric(horizontal: 116, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),  
                ),        
               ),



      
             
      ]
    ),

   

      
    );
  }
}