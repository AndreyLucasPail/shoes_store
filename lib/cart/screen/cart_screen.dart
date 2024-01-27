import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/cart/tile/cart_tile.dart';
import 'package:shoes_store/cart/tile/empty_cart_tile.dart';
import 'package:shoes_store/cart/widget/price_card.dart';
import 'package:shoes_store/cart/widget/ship_card.dart';
import 'package:shoes_store/cart/tile/user_not_logged_tile.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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

    loadCartItems();
    
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
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
        title: const Text("Meu Carrinho"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CartModel>>(
        key: UniqueKey(),
        stream: cartBloc.cartStream, 
        builder: (context, snapshot){
          if(!snapshot.hasData || snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator(),
            );

          }else if(!userBloc.isLoggedIn()){
            return const UserNotLogged();

          }else if(snapshot.data!.isEmpty){
            return const EmptyCartTile();

          }else{

            final cartItem = snapshot.data!;

            List<Widget> cartWidget = cartItem.map((cartCard) {
              return CartTile(cartProduct: cartCard, cartBloc: cartBloc,);
            }).toList();

            return ListView(
              children: [
                Column(
                  children: cartWidget,
                ),
                const ShipCard(), 
                CardPrice(cartBloc: cartBloc,),
              ],
            );
          }
        }
      ),
    );
  }

  void loadCartItems() async {
    await cartBloc.loadCartItem();
  }
}