import 'package:flutter/material.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/ui/orders/tab/track_order_tab.dart';
import 'package:shoes_store/ui/orders/tile/address_tile.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key, this.order});

  static const tag = "/trackOrder";

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("Rastreamento do pedido"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TrackOrderCard(
            order: order,
          ),
          TrackOrderTab(
            order: order,
          ),
        ],
      ),
    );
  }
}
