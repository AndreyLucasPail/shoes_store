import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.keyboardType, this.obscureText,
   this.prefix, this.validetor});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefix;
  final String Function(String?)? validetor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
      child: TextFormField(
        cursorColor: Colors.black,
        validator: validetor,
        obscureText: obscureText!,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 38, 24, 94),
              width: 2,
            )
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 38, 24, 94),
              width: 2,
            ), 
          ),
          prefixIcon: prefix!,
          prefixIconColor: const Color.fromARGB(255, 38, 24, 94),
        ),
      ),
    );
  }
}