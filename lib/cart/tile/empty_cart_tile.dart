import 'package:flutter/material.dart';

class EmptyCartTile extends StatelessWidget {
  const EmptyCartTile({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 15,),
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