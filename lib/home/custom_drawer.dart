import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/home/screens/login_screen.dart';
import 'package:shoes_store/home/widget/Expansion_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
 
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: 170,
              color: const Color.fromARGB(255, 38, 24, 94),
              child: Stack(
                children: [
                  const Positioned(
                    top: 20.0,
                    left: 25.0,
                    child: Text(
                      "SNKRS \n Store",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 2.0,
                    child: userBloc.isLoggedIn() ? Text("Bem Vindo,\n ${userBloc.loadCurrentUser()}") :
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginScreen())
                        );
                      },
                      child: const Text(
                        "Entre ou Cadastre-se >",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    )
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
        )
      ),
    );
  }
}