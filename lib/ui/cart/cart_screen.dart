import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/ui/cart/widget/product_card.dart';
import 'package:shoes_store/ui/cart/widget/price_card.dart';
import 'package:shoes_store/ui/cart/widget/ship_card.dart';
import 'package:shoes_store/model/cart_model.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const tag = "/cartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();
    cartBloc = CartBloc();

    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await userBloc.loadCurrentUser();
        await cartBloc.loadCartItem();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        title: const Text("Meu Carrinho"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return StreamBuilder<List<CartModel>>(
      stream: cartBloc.cartStream,
      builder: (context, snapshot) {
        if (!userBloc.isLoggedIn()) {
          return userNotLogged();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return emptyCart();
        } else {
          final cartItem = snapshot.data!;

          List<Widget> cartWidget = cartItem.map((cartCard) {
            return ProductCard(
              cartProduct: cartCard,
              cartBloc: cartBloc,
            );
          }).toList();

          return ListView(
            children: [
              Column(
                children: cartWidget,
              ),
              const ShipCard(),
              CardPrice(
                cartBloc: cartBloc,
              ),
            ],
          );
        }
      },
    );
  }

  Widget userNotLogged() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.person_off_sharp,
            color: CustomColors.midNigthBlue,
            size: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Faça login para adicionar produtos ao carrinho.",
            style: TextStyle(
              color: CustomColors.midNigthBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.tag);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.midNigthBlue,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyCart() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.remove_shopping_cart,
            size: 120,
            color: Color.fromARGB(255, 38, 24, 94),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Nenhum Produto no carrinho",
            style: TextStyle(
              color: Color.fromARGB(255, 38, 24, 94),
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
