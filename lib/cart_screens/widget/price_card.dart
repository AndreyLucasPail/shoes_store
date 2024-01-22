import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';

class CardPrice extends StatelessWidget {
  const CardPrice({super.key});

  @override
  Widget build(BuildContext context) {

    CartBloc cartBloc = CartBloc();

    double ship = cartBloc.shipPrice();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Resumo do pedido:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16,),
            const Row(
              children: [
                Text(
                  "Subtotal:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black,),
            const Row(
              children: [
                Text(
                  "Descontos",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Frete",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "R\$ ${ship.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                  shape: const StadiumBorder(),
                ),
                onPressed: (){}, 
                child: const Text(
                  "Finalizar Pedido",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}