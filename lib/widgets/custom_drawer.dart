import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/ui/home/tiles/Expansion_tile.dart';
import 'package:shoes_store/model/user_model.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc();

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          if (mounted) {
            userBloc.loadCurrentUser().then(
              (value) {
                if (value != null) {
                  setState(() {});
                }
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: 170,
              color: CustomColors.midNigthBlue,
              child: Stack(
                children: [
                  const Positioned(
                    top: 40.0,
                    left: 25.0,
                    child: Text(
                      "SNKRS Store",
                      style: TextStyle(
                        color: CustomColors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 10.0,
                    child: userBloc.isLoggedIn()
                        ? StreamBuilder<UserModel?>(
                            stream: userBloc.outUser,
                            builder: (context, snapshot) {
                              return Text(
                                "Bem Vindo, \n${snapshot.data?.name}",
                                style: const TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 18,
                                ),
                              );
                            },
                          )
                        : TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                LoginScreen.tag,
                              );
                            },
                            child: const Text(
                              "Entre ou Cadastre-se >",
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            const ExpansionTileDrawer(
              text: "Basquete",
              image: "assets/bola-de-basquete.png",
              category: "basketball",
            ),
            const ExpansionTileDrawer(
              text: "Corrida",
              image: "assets/corrida.png",
              category: "run",
            ),
            const ExpansionTileDrawer(
              text: "Futebol",
              image: "assets/chute.png",
              category: "futball",
            ),
            const ExpansionTileDrawer(
              text: "Tênis casual",
              image: "assets/sapatos.png",
              category: "casual",
            ),
            const ExpansionTileDrawer(
              image: "assets/skate.png",
              text: "Skate",
              category: "skate",
            ),
            const ExpansionTileDrawer(
              image: "assets/andando.png",
              text: "Caminhada",
              category: "walk",
            ),
            const ExpansionTileDrawer(
              image: "assets/volei.png",
              text: "Volei",
              category: "volleyball",
            ),
          ],
        ),
      ),
    );
  }
}
