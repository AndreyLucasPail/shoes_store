import 'package:flutter/material.dart';
import 'package:shoes_store/home/widget/Expansion_tile.dart';
import 'package:shoes_store/home/widget/drawer_tile.dart';
import 'package:shoes_store/products-screen/products_screen.dart';

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
            ExpansionTileDrawer(),
            ExpansionTile(
              expandedAlignment: Alignment.center,
              title: const DrawerTile(
                text: "Basquete",
                image: "assets/bola-de-basquete.png",
              ),
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "basketball", brand: "Nike",))
                    );
                  }, 
                  child: const Text(
                    "Nike",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "basketball", brand: "adidas",))
                    );
                  }, 
                  child: const Text(
                    "Adidas",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "basketball", brand: "jordan",))
                    );
                  }, 
                  child: const Text(
                    "Jordan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  )
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "basketball", brand: "underArmour",))
                    );
                  }, 
                  child: const Text(
                    "Under Armour",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text(
                    "Ver Todos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const DrawerTile(
                image: "assets/corrida.png",
                text: "Corrida",
              ),
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "Nike",))
                    );
                  }, 
                  child: const Text(
                    "Nike",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "adidas",))
                    );
                  }, 
                  child: const Text(
                    "Adidas",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "asics",))
                    );
                  }, 
                  child: const Text(
                    "Asics",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "newBalance",))
                    );
                  }, 
                  child: const Text(
                    "New Balance",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "puma",))
                    );
                  }, 
                  child: const Text(
                    "Puma",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "reebok",))
                    );
                  }, 
                  child: const Text(
                    "ReeBok",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "underArmour",))
                    );
                  }, 
                  child: const Text(
                    "Under Armour",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ProductsScreen(category: "run", brand: "Nike",))
                    );
                  }, 
                  child: const Text(
                    "Ver Todos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const DrawerTile(
              image: "assets/chute.png",
              text: "Futebol",
            ),
            const DrawerTile(
              image: "assets/sapatos.png",
              text: "Tênis casual",
            ),
            const DrawerTile(
              image: "assets/skate.png",
              text: "Skate",
            ),
            const DrawerTile(
              image: "assets/andando.png",
              text: "Caminhada",
            ),
            const DrawerTile(
              image: "assets/volei.png",
              text: "Volei",
            ),
          ],
        )
      ),
    );
  }
}