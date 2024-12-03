import 'package:flutter/material.dart';
import 'package:booki/paginas/login.dart';
import 'package:booki/paginas/registro.dart';
import 'package:booki/paginas/principal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booki',
      initialRoute: 'login',
      routes: {
        'pantalla1': (context) => const Login(),
        'pantalla2': (context) => const Registro(),
        'pantalla3': (context) => const Principal(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
