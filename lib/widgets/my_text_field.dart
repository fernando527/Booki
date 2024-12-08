import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Text myLabel;
  final Icon? prefixIcon;
  final IconButton? suffixIconButton;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool hidePW;
  final int maxLength;

  const MyTextField(
      {super.key,
      this.prefixIcon,
      required this.myLabel,
      this.suffixIconButton,
      this.controller,
      this.validator,
      this.hidePW = false,
      this.maxLength = 30});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLength: widget.maxLength,
              obscureText: widget.hidePW,
              validator: widget.validator,
              controller: widget.controller,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: widget.prefixIcon,
                label: widget.myLabel, 
                suffixIcon: widget.suffixIconButton,
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.black, width: 2,
                  )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
