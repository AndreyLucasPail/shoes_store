import 'package:flutter/material.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/orders_screen/tile/track_order_tile.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key, this.order});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("Rastreamento do pedido"),
        centerTitle: true,
      ),
      body: ListView(
      children: [
        TrackOrderCard(order: order,)
        ],
      ),
    );
  }
}