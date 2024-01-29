import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/user/screen/edit_user.dart';
import 'package:shoes_store/user/tile/user_tile.dart';

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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: StreamBuilder<UserModel>(
        stream: userBloc.outUser,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{

            final userModel = snapshot.data;

            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                        color: Color.fromARGB(255, 38, 24, 94),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/homem.png"))
                            ),
                          ),
                          const SizedBox(height: 25,),
                          SizedBox(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EditUserScreen(userModel: userModel!,))
                                );
                              }, 
                              child: const Text(
                                "Editar perfil >",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserTile(userModel: userModel!),
                    ),
                  ],
                ),
              ],
            );
          }
        }
      ),
    );
  }
}