import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartProduct,});

  final CartModel? cartProduct;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Slidable(
        endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25, 
        children: [
          SlidableAction(onPressed: (context){},
          icon: Icons.delete,
          backgroundColor: const Color.fromARGB(255, 38, 24, 94),
            ),          
          ]
        ),        
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
      ),
    );
  }
}