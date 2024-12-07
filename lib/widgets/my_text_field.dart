import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Text myLabel;
  final Icon? prefixIcon;
  final IconButton? suffixIconButton;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool hidePW;

  const MyTextField(
      {super.key,
      this.prefixIcon,
      required this.myLabel,
      this.suffixIconButton,
      this.controller,
      this.validator,
      this.hidePW = false});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        obscureText: widget.hidePW,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          label: widget.myLabel,
          suffixIcon: widget.suffixIconButton,
        ),
      ),
    );
  }
}
