import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartProduct, this.cartBloc,});

  final CartModel? cartProduct;
  final CartBloc? cartBloc;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: const Color.fromARGB(255, 38, 24, 94),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete, color: Colors.white,),
                Icon(Icons.delete, color: Colors.white,),
              ],
            ),
          )
        ),
        onDismissed: (direction) {
          cartBloc!.removeCartProduct(cartProduct!);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                    "${cartProduct!.imgCart}"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "${cartProduct!.model}\n\n",
                  style: const TextStyle(),
                ),
                Text("${cartProduct!.price}"),
              ],
            ),
            StreamBuilder<int>(
              stream: cartBloc!.quantityStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartBloc!.decProduct(cartProduct!);
                      },
                      icon: const Icon(Icons.remove)
                    ),
                    Text("${cartProduct!.quantity}"),
                    IconButton(
                      onPressed: () {
                        cartBloc!.incProduct(cartProduct!);
                      }, 
                      icon: const Icon(Icons.add)
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}