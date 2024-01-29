// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/user/widget/user_text_field.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, this.userModel});

  final UserModel? userModel;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState(userModel);
}

class _EditUserScreenState extends State<EditUserScreen> {
  _EditUserScreenState(this.userModel);

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("Editar perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UserTextField(
              labelText: "Nome:",
              hintText: "${userModel!.name}",
            ),
            UserTextField(),
            UserTextField(),
            UserTextField(),
            UserTextField(),
            UserTextField(),
          ],
        ),
      ),
    );
  }
}