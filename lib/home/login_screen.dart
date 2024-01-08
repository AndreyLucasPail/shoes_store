import 'package:flutter/material.dart';
import 'package:shoes_store/home/singup_screen.dart';
import 'package:shoes_store/home/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "SNKRS"
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: 170,
                child: Image.asset("assets/pngwing.com.png")
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email:")
              ),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                controller: emailController,
                prefix: const Icon(Icons.person),
              ),
              const SizedBox(height: 8,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Senha:")
              ),
              CustomTextField(
                keyboardType: TextInputType.multiline,
                obscureText: false,
                controller: passwordController,
                prefix: const Icon(Icons.lock),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                    shape: const StadiumBorder()
                  ),
                  onPressed: () {}, 
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                    shape: const StadiumBorder()
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const SingUp())
                    );
                  }, 
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}