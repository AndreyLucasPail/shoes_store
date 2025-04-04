// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shoes_store/mixins/singup_mixin.dart';
import 'package:shoes_store/ui/home/homepage.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';
import 'package:shoes_store/widgets/login_custom_text_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  static const tag = "/singUp";

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> with SingupMixin {
  @override
  void dispose() {
    super.dispose();
    userBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        iconTheme: const IconThemeData(
          color: CustomColors.white,
        ),
        centerTitle: true,
        title: const Text(
          "SNKRS",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              image(),
              input(
                text: "Nome:",
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.person,
                stream: userBloc.outName,
                onChanged: userBloc.changeName,
              ),
              input(
                text: "E-mail:",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.person,
                stream: userBloc.outEmail,
                onChanged: userBloc.changeEmail,
              ),
              input(
                text: "Senha:",
                controller: passwordController,
                keyboardType: TextInputType.multiline,
                icon: Icons.lock,
                stream: userBloc.outpass,
                onChanged: userBloc.changePass,
              ),
              input(
                text: "Confirme a Senha:",
                controller: confirmPasswordController,
                keyboardType: TextInputType.multiline,
                icon: Icons.lock,
              ),
              confirmPasswordInput(),
              cepInput(),
              addressInput(),
              neighborhoodInput(),
              cityInput(),
              stateInput(),
              birthdayInput(),
              const SizedBox(height: 20),
              finishButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget image() {
    return SizedBox(
      height: 170,
      width: 170,
      child: Image.asset("assets/pngwing2.com.png"),
    );
  }

  Widget confirmPasswordInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Confirme a Senha:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: confirmPasswordController,
          keyboardType: TextInputType.multiline,
          obscureText: true,
          prefix: const Icon(Icons.lock),
          validator: validateConfirmPassword,
        ),
      ],
    );
  }

  Widget cepInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "CEP:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: cepController,
          keyboardType: TextInputType.number,
          obscureText: false,
          prefix: const Icon(Icons.house),
          stream: userBloc.outCep,
          onChanged: userBloc.changeCep,
        ),
      ],
    );
  }

  Widget addressInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Endereço:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: addressController,
          keyboardType: TextInputType.streetAddress,
          obscureText: false,
          prefix: const Icon(Icons.house),
          stream: userBloc.outAddress,
          onChanged: userBloc.changeAddres,
        ),
      ],
    );
  }

  Widget neighborhoodInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Bairro:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: neighborhoodController,
          keyboardType: TextInputType.streetAddress,
          obscureText: false,
          prefix: const Icon(Icons.house),
        ),
      ],
    );
  }

  Widget cityInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cidade:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: cityController,
          keyboardType: TextInputType.streetAddress,
          obscureText: false,
          prefix: const Icon(Icons.house),
        ),
      ],
    );
  }

  Widget stateInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Estado:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: stateController,
          keyboardType: TextInputType.streetAddress,
          obscureText: false,
          prefix: const Icon(Icons.house),
        ),
      ],
    );
  }

  Widget birthdayInput() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Data de Nascimento:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: birthdayController,
          keyboardType: TextInputType.datetime,
          obscureText: false,
          prefix: const Icon(Icons.cake),
          stream: userBloc.outBirthday,
          onChanged: userBloc.changeBirthday,
        ),
      ],
    );
  }

  Widget input({
    required String text,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required IconData icon,
    Stream<String>? stream,
    Function(String)? onChanged,
  }) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: false,
          prefix: Icon(icon),
          stream: stream,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget finishButton() {
    return SizedBox(
      height: 50,
      width: 300,
      child: StreamBuilder<bool>(
        stream: userBloc.submitedValidSingUp(),
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: () {
              Map<String, dynamic> userData = {
                "name": nameController.text,
                "email": emailController.text,
                "CEP": cepController.text,
                "birthday": birthdayController.text,
                "adress": addressController.text,
                "neighborhood": neighborhoodController.text,
                "city": cityController.text,
                "state": stateController.text,
              };

              userBloc.singUp(
                userData: userData,
                password: passwordController.text,
                onSuccess: onSuccess,
                onFail: onFail,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: CustomColors.midNigthBlue,
            ),
            child: const Text(
              "Finalizar Cadastro",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Usuário criado com sucesso!"),
        duration: Duration(seconds: 1),
        backgroundColor: CustomColors.midNigthBlue,
      ),
    );
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        Navigator.pushReplacementNamed(context, HomePage.tag);
      },
    );
  }

  void onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Erro ao criar Usuário!"),
        backgroundColor: CustomColors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  String? validateConfirmPassword(String? text) {
    if (text == null ||
        text.isEmpty ||
        passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }
}
