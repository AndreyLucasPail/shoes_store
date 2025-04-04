import 'package:flutter/material.dart';
import 'package:shoes_store/mixins/login_mixin.dart';
import 'package:shoes_store/ui/singUp/singup_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';
import 'package:shoes_store/widgets/login_custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const tag = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginMixin {
  @override
  void dispose() {
    super.dispose();

    userBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey200,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.white),
        title: const Text(
          "SNKRS",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.midNigthBlue,
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
        child: Column(
          children: [
            image(),
            inputEmail(),
            const SizedBox(height: 8),
            inputPassword(),
            const SizedBox(height: 30),
            enterButton(),
            const SizedBox(height: 8),
            createAcountButton(),
          ],
        ),
      ),
    );
  }

  Widget image() {
    return SizedBox(
      height: 170,
      width: 170,
      child: Image.asset("assets/pngwing.com.png"),
    );
  }

  Widget inputEmail() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Email:"),
        ),
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          controller: emailController,
          prefix: const Icon(Icons.person),
        ),
      ],
    );
  }

  Widget inputPassword() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Senha:"),
        ),
        CustomTextField(
          keyboardType: TextInputType.multiline,
          obscureText: true,
          controller: passwordController,
          prefix: const Icon(Icons.lock),
        )
      ],
    );
  }

  Widget enterButton() {
    return SizedBox(
      height: 50,
      width: 300,
      child: StreamBuilder<Object>(
        stream: userBloc.submitedValid(),
        builder: (context, snapshot) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.midNigthBlue,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              userBloc.login(
                emailController.text,
                passwordController.text,
                onSuccess,
                onFail,
              );
            },
            child: const Text(
              "Entrar",
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createAcountButton() {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.midNigthBlue,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          Navigator.pushNamed(context, SingUpScreen.tag);
        },
        child: const Text(
          "Criar Conta",
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: CustomColors.midNigthBlue,
        content: Text("Usuário logado com sucesso"),
      ),
    );

    Navigator.of(context).pop();
  }

  void onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: CustomColors.red,
        content: Text(
          "Erro ao entrar!!",
          style: TextStyle(
            color: CustomColors.black,
          ),
        ),
      ),
    );
  }
}
