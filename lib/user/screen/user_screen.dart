import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();

    FirebaseAuth.instance
    .authStateChanges().listen((User? user) {
      if(user != null){
        userBloc.loadCurrentUser();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      body: StreamBuilder<UserModel>(
        stream: userBloc.outUser,
        builder: (context, snapshot) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: (){}, 
                        child: const Text("Editar perfil >"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}