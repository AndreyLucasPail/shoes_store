import 'package:flutter/material.dart';
import 'package:shoes_store/ui/orders/orders_screen.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class FinishOrder extends StatefulWidget {
  const FinishOrder({super.key, this.orderId});

  final String? orderId;

  @override
  State<FinishOrder> createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 120,
          ),
          const SizedBox(height: 30),
          const Text(
            "Pedido realizado com sucesso",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            "codigo do pedido: ${widget.orderId}",
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 38, 24, 94),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, OrderScreen.tag);
              },
              child: const Text(
                "Acompanhar Pedido",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
