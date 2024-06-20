import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/ui/orders/screen/track_order_screen.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, this.order});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");
    DateTime orderDateTime = order!.orderDate!.toDate();
    String orderDateFormat = DateFormat("dd/MM/yy").format(orderDateTime);

    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Data do pedido: $orderDateFormat",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Resumos do pedido:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                  children: order!.products!.map((item) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item["model"],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "R\$ ${formatNumber.format(item["price"])}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    )
                  ],
                );
              }).toList()),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Valor total do pedido:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "R\$ ${formatNumber.format(order!.totalPrice)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrackOrder(
                              order: order,
                            )));
                  },
                  child: const Text(
                    "Acompanhar pedido",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
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
