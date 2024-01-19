import 'package:flutter/material.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartProduct,});

  final CartModel? cartProduct;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  cartProduct!.productsModel!.images![0]),
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text("${cartProduct!.productsModel!.name}"),
              Text("${cartProduct!.price}"),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove)
              ),
              Text("${cartProduct!.quantity}"),
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.add)
              ),
            ],
          ),
        ],
      ),
    );
  }
}