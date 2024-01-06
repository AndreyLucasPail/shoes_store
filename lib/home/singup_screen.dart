import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/singup_bloc.dart';
import 'package:shoes_store/home/homepage.dart';
import 'package:shoes_store/home/singin_screen.dart';
import 'package:shoes_store/home/widget/custom_text_field.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  
  final SingUpBloc singupBloc = SingUpBloc();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cepController = TextEditingController();
  final birthdayController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    singupBloc.dispose();
  }

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
                  stream: singupBloc.outName,
                  onChanged: singupBloc.changeName,
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
                  stream: singupBloc.outEmail,
                  onChanged: singupBloc.changeEmail,
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
                  obscureText: true,
                  prefix: const Icon(Icons.lock),
                  stream: singupBloc.outpass,
                  onChanged: singupBloc.changePass,
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
                  obscureText: true,
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
                  stream: singupBloc.outCep,
                  onChanged: singupBloc.changeCep,
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
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  obscureText: false,
                  prefix: const Icon(Icons.house),
                  stream: singupBloc.outAddress,
                  onChanged: singupBloc.changeAddres,
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
                  controller: birthdayController,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  prefix: const Icon(Icons.cake),
                  stream: singupBloc.outBirthday,
                  onChanged: singupBloc.changeBirthday,
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
                  child: StreamBuilder<bool>(
                    stream: singupBloc.submitedValid(),
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: () {
                          Map<String, dynamic> userData ={
                            "name": nameController.text, 
                            "password": passwordController.text, 
                            "email": emailController.text, 
                            "CEP": cepController.text, 
                            "birthday": birthdayController.text, 
                            "adress": addressController.text,
                          };
                  
                          singupBloc.singUp(
                            userData: userData,
                            firebaseUser: nameController.text, 
                            password: passwordController.text,
                            onSuccess: onSuccess,
                            onFail: onFail,
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
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Usuário criado com sucesso!"),
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromARGB(255, 38, 24, 94),
      ),
    );
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())
      );
    });
  }

  void onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Erro ao criar Usuário!"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}