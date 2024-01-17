import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/cart_screens/widgets/cart_tile.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartBloc cartBloc = CartBloc();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      body: StreamBuilder<CartModel>(
        stream: null,
        builder: (context, snapshot) {
          return ListView(
            children: [
                    Column(
                      children: [
                        cartBloc.product.map((products) {
                      return CartTile(cartProduct: products,)
                    }).toList();
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}