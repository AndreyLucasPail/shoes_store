import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, this.orderId});

  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Card(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}