import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/home/singin_screen.dart';
import 'package:shoes_store/home/widget/custom_text_field.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  
  final UserBloc userBloc = UserBloc();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cepController = TextEditingController();
  final birthdayController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        centerTitle: true,
        title: const Text("SNKRS"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 20),
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  width: 170,
                  child: Image.asset("assets/pngwing2.com.png")
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nome:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomTextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  prefix: const Icon(Icons.person),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "E-mail:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  prefix: const Icon(Icons.person),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Senha:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  prefix: const Icon(Icons.lock),
                ),
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
                  obscureText: false,
                  prefix: const Icon(Icons.lock),
                ),
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
                ),
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
                  controller: cepController,
                  keyboardType: TextInputType.streetAddress,
                  obscureText: false,
                  prefix: const Icon(Icons.house),
                ),
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
                  controller: cepController,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  prefix: const Icon(Icons.cake),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const SingIn())
                      );
                    }, 
                    child: const Text(
                      "Já tem uma conta? Entrar",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      userBloc.saveUser(
                        nameController.text, 
                        passwordController.text, 
                        emailController.text, 
                        cepController.text, 
                        birthdayController.text, 
                        addressController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                    ),
                    child: const Text(
                      "Finalizar Cadastro",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}