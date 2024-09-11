import 'package:carousel_slider/carousel_slider.dart' hide CarouselController;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/ui/cart/cart_screen.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/widgets/custom_drawer.dart';
import 'package:shoes_store/ui/home/tiles/products_tile.dart';
import 'package:shoes_store/ui/orders/orders_screen.dart';
import 'package:shoes_store/ui/user/user_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const tag = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc = UserBloc();

  List ads = [
    "assets/jordan1.png",
    "assets/curry.jpg",
    "assets/adidas.png",
    "assets/nike4.png",
  ];

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      userBloc.loadCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.white),
        backgroundColor: CustomColors.midNigthBlue,
        title: const Text(
          "SNKRS",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        actions: [appBarActions()],
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            carouselAds(),
            const SizedBox(height: 30),
            const ProductsTile(),
          ],
        ),
      ),
    );
  }

  Widget appBarActions() {
    return PopupMenuButton(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: const Icon(
        Icons.person_2_rounded,
        color: CustomColors.white,
      ),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          onTap: () {
            !userBloc.isLoggedIn()
                ? Navigator.pushNamed(context, LoginScreen.tag)
                : Navigator.pushNamed(context, UserScreen.tag);
          },
          child: const Text(
            "Perfil",
            style: TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.pushNamed(context, OrderScreen.tag);
          },
          child: const Text(
            "Meus Pedidos",
            style: TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.pushNamed(context, CartScreen.tag);
          },
          child: const Text(
            "Carrinho",
            style: TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            userBloc.isLoggedIn()
                ? userBloc.singOut()
                : Navigator.pushNamed(context, LoginScreen.tag);
          },
          child: Text(
            userBloc.isLoggedIn() ? "Sair" : "Entrar",
            style: const TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget carouselAds() {
    return CarouselSlider.builder(
      itemCount: ads.length,
      itemBuilder: (context, item, __) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ads[item]),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
      ),
    );
  }
}
