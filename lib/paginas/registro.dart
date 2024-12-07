import 'package:flutter/material.dart';
import 'package:booki/widgets/my_text_field.dart';
import 'package:booki/widgets/my_title.dart';

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
      appBar: AppBar(
        title: const Text("Booki"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTitle(title: "Registro"),
              const SizedBox(height: 15),
              MyTextField(
                  hidePW: false,
                  myLabel: Text("Nombre"),
                  controller: nameController,
                  validator: (name) {
                    if (name!.length < 3) {
                      return "Nombre no tiene suficientes caracteres";
                    }
                    return null;
                  }),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              MyTextField(
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
              const SizedBox(height: 15),
              MyTextField(
                hidePW: hidePW,
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
              const SizedBox(height: 15),
              MyTextField(
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
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    // print("Nombre: ${nameController.text}");
                    // print("Correo: ${emailController.text}");
                    // print("Telefono: ${phoneController.text}");
                    // print("Contraseña: ${pwController.text}");
                  },
                  child: const Text("Registrarse"))
            ],
          ),
        ),
      ),
    );
  }
}
