import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/cart/screen/cart_screen.dart';
import 'package:shoes_store/home/tiles/ads_tile.dart';
import 'package:shoes_store/home/widget/custom_drawer.dart';
import 'package:shoes_store/home/tiles/product_tile.dart';
import 'package:shoes_store/orders/screen/orders_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        actions: [
          PopupMenuButton(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            icon: const Icon(Icons.person_2_rounded),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  
                },
                child: const Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OrderScreen())
                  );
                },
                child: const Text(
                  "Meus Pedidos",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen())
                  );
                },
                child: const Text(
                  "Carrinho",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              PopupMenuItem(
                onTap: (){
                  userBloc.singOut();
                },
                child: const Text(
                  "Sair",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ]
          ),
        ],
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AdsTile(
                image: "assets/jordan1.png",
                width: MediaQuery.of(context).size.width,
                height: 220,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductsTile(brand: "adidas", category: "basketball",),
              ),
              AdsTile(
                image: "assets/curry.jpg",
                width: MediaQuery.of(context).size.width,
                height: 210,
              ),
              AdsTile(
                image: "assets/adidas.png",
                width: MediaQuery.of(context).size.width,
                height: 180,
              ),
              AdsTile(
                image: "assets/jordan3.jpg",
                width: MediaQuery.of(context).size.width,
                height: 450,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductsTile(category: "run", brand: "Nike",),
              ),
              AdsTile(
                image: "assets/nike4.png",
                width: MediaQuery.of(context).size.width,
                height: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }

}