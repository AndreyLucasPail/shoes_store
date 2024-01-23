// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/cart_screens/finished_order_screen.dart';

class CardPrice extends StatelessWidget {
  const CardPrice({super.key, this.cartBloc});

  final CartBloc? cartBloc;

  @override
  Widget build(BuildContext context) {

    double ship = cartBloc!.shipPrice();

    return StreamBuilder<double>(
      stream: cartBloc!.priceStream,
      builder: (context, snapshot) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subtotal:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text("R\$ ${cartBloc!.getPrice().toStringAsFixed(2)}"),
                  ],
                ),
                const Divider(color: Colors.black,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Descontos",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "R\$ 0.0",
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
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "R\$ ${(cartBloc!.getPrice().toDouble() + ship.toDouble()).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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
                    onPressed: () async {
                      cartBloc!.finishOrder();

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FinishOrder())
                      );
                    }, 
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
    );
  }
}