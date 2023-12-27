import 'package:flutter/material.dart';
import 'package:shoes_store/home/widget/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Entre ou Cadastre-se",
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
            ExpansionTile(
              expandedAlignment: Alignment.center,
              title: const DrawerTile(
                image: "assets/bola-de-basquete.png",
                text: "Basquete",
                category: "basquete",
              ),
              children: [
                TextButton(onPressed: (){}, child: Text("Nike")),
                TextButton(onPressed: (){}, child: Text("Adidas")),
                TextButton(onPressed: (){}, child: Text("Jordan")),
                TextButton(onPressed: (){}, child: Text("Under Armour")),
              ],
            ),
            const DrawerTile(
              image: "assets/corrida.png",
              text: "Corrida",
              category: "corrida",
            ),
            const DrawerTile(
              image: "assets/chute.png",
              text: "Futebol",
              category: "futebol",
            ),
            const DrawerTile(
              image: "assets/sapatos.png",
              text: "Tênis casual",
              category: "casual",
            ),
            const DrawerTile(
              image: "assets/skate.png",
              text: "Skate",
              category: "skate",
            ),
            const DrawerTile(
              image: "assets/andando.png",
              text: "Caminhada",
              category: "caminhada",
            ),
            const DrawerTile(
              image: "assets/volei.png",
              text: "Volei",
              category: "volei",
            ),
          ],
        )
      ),
    );
  }
}