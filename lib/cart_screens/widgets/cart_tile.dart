import 'package:flutter/material.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartProduct});

  final CartModel? cartProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [

        ],
      ),
    );
  }
}