import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.keyboardType, this.obscureText});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );
  }
}