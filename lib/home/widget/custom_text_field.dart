import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.keyboardType, this.obscureText,
   this.prefix, this.onChanged,this.stream});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefix;
  final Function(String)? onChanged;
  final Stream<String>? stream;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
          child: TextFormField(
            cursorColor: Colors.black,
            onChanged: onChanged,
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
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2
                ),
              ),
              prefixIcon: prefix!,
              prefixIconColor: const Color.fromARGB(255, 38, 24, 94),
              errorText: snapshot.hasError ? snapshot.error as String : null,
            ),
          ),
        );
      }
    );
  }
}