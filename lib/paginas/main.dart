import 'package:flutter/material.dart';
import 'package:booki/paginas/login.dart';
import 'package:booki/paginas/registro.dart';
import 'package:booki/paginas/principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:booki/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booki',
      initialRoute: 'pantalla1',
      routes: {
        'pantalla1': (context) => const Login(),
        'pantalla2': (context) => const Registro(),
        'pantalla3': (context) => const Principal(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
      ),
    );
  }
}
