import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/orders_screen/track_order_screen.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, this.order});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {

    NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Codigo do pedido: ${order!.id}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Resumos do pedido:",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                children: 
                  order!.products!.map((item) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item["model"],
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "R\$ ${formatNumber.format(item["price"])}",
                              style: const TextStyle(
                                fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3,)
                      ],
                    );
                  }).toList()                  
              ),
              const SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Valor total do pedido:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "R\$ ${formatNumber.format(order!.totalPrice)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TrackOrder(order: order,))
                    );
                  }, 
                  child: const Text(
                    "Acompanhar pedido",
                    style: TextStyle(
                      fontSize: 18,letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}