import 'package:flutter/material.dart';

class ShipCard extends StatelessWidget {
  const ShipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: ExpansionTile(
          title: Text("Frete"),
          children: [
            TextField()
          ],
        ),
      ),
    );
  }
}