import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    this.controller,
    this.inputType,
    this.labelText,
    this.hintText,
  });

  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
