import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/ui/edit-user/edit_user.dart';
import 'package:shoes_store/widgets/user_tile.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  static const tag = "/userScreen";

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userBloc.loadCurrentUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.midNigthBlue,
        appBar: appBar(),
        body: body(),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.midNigthBlue,
      iconTheme: const IconThemeData(color: CustomColors.white),
      title: const Text(
        "Perfil",
        style: TextStyle(
          color: CustomColors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: StreamBuilder<UserModel>(
        stream: userBloc.outUser,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            UserModel? userModel = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/homem.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditUserScreen(
                            userModel: userModel!,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Editar perfil",
                      style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: CustomColors.grey100,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: UserTile(userModel: userModel!),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
