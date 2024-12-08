import 'package:booki/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:booki/widgets/my_text_field.dart';
import 'package:booki/widgets/my_title.dart';
import 'package:booki/apis/firestore_service.dart';

void main() => runApp(const Registro());

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pwController = TextEditingController();
  final pwConfirmationController = TextEditingController();

  bool hidePW = true;

  @override
  void initState() {
    super.initState();
    hidePW = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pwController.dispose();
    pwConfirmationController.dispose();
    super.dispose();
  }

  // validateName(String name) {
  //   if (name.length < 3) {
  //     return "Nombre no tiene suficientes caracteres";
  //   }
  //   return null;
  // }

  // validateEmail(String email) {
  //   if (!(email.contains('@') &&
  //       (email.contains("unah.edu.hn") || (email.contains("unah.hn"))))) {
  //     return "El correo ingresado no es valido";
  //   }
  //   return null;
  // }

  // validatePhone(String phone) {
  //   if ((phone[0] != '3' || phone[0] != '9') && (phone.length != 8)) {
  //     return "El numero ingresado no es valido";
  //   }
  //   return null;
  // }

  // validatePassword(String password) {
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //   RegExp regExp = RegExp(pattern);
  //   if (!regExp.hasMatch(password)) {
  //     return "La contraseña no cumple los requisitos minimos";
  //   }
  //   return null;
  // }

  // validatePwConfirmation(String password, String passwordConfirmation) {
  //   if (password != passwordConfirmation) {
  //     return "Las contraseñas no son iguales";
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 173, 230, 187),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 50),
              Padding(padding: EdgeInsets.only(left: 20),
                child: MyTitle(title: "Registro", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              ),
              MyTextField(
                  maxLength: 20,
                  hidePW: false,
                  myLabel: Text("Nombre"),
                  controller: nameController,
                  validator: (name) {
                    if (name!.length < 3) {
                      return "Nombre no tiene suficientes caracteres";
                    }
                    return null;
                  }),
             
              MyTextField(
                  hidePW: false,
                  myLabel: Text("Correo"),
                  controller: emailController,
                  validator: (email) {
                    if (!(email!.contains('@') &&
                        (email.contains("unah.edu.hn") ||
                            (email.contains("unah.hn"))))) {
                      return "El correo ingresado no es valido";
                    }
                    return null;
                  }),
              
              MyTextField(
                maxLength: 20,
                hidePW: false,
                myLabel: Text("Telefono"),
                controller: phoneController,
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return "Ingrese un numero";
                  } else {
                    if ((phone[0] != '3' || phone[0] != '9') &&
                        phone.length != 8) {
                      return "Numero ingresado no es valido";
                    }
                  }
                  return null;
                },
              ),
              
              MyTextField(
                hidePW: hidePW,
                maxLength: 30,
                myLabel: Text("Contraseña"),
                controller: pwController,
                validator: (password) {
                  const String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regExp = RegExp(pattern);
                  if (password != null && !regExp.hasMatch(password)) {
                    return "La contraseña no cumple los requisitos minimos";
                  }
                  return null;
                },
                suffixIconButton: IconButton(
                  icon: Icon(hidePW ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        hidePW = !hidePW;
                      },
                    );
                  },
                ),
              ),
              
              MyTextField(
                maxLength: 30,
                hidePW: hidePW,
                myLabel: Text("Confirmar contraseña"),
                controller: pwConfirmationController,
                validator: (pwConfirmation) {
                  if (pwConfirmation != pwController.text) {
                    return "Las contraseñas no son iguales";
                  }
                  return null;
                },
                suffixIconButton: IconButton(
                  icon: Icon(hidePW ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        hidePW = !hidePW;
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  
                  onPressed: () {
                   // if (_formKey.currentState!.validate()) {
                     // Usuarios u1 = Usuarios(
                       //   correo: emailController.text,
                         // nombre: nameController.text);
                      //FirestoreService.agregarUsuario(u1);
                   // }
                    // print("Nombre: ${nameController.text}");
                    // print("Correo: ${emailController.text}");
                    // print("Telefono: ${phoneController.text}");
                    // print("Contraseña: ${pwController.text}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(200, 173, 230, 187),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10)
                  ),
                  child: const Text("Registrarse",
                    style: TextStyle(color: Colors.white, fontSize: 18)
                    ),
                  ),
              )
               
            ],
      
          ),
        ),
      ),
    );
  }
}
