import 'package:flutter/material.dart';

class ShipCard extends StatelessWidget {
  const ShipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: ExpansionTile(
          title: const Text("Calcular Frete"),
          leading: const Icon(Icons.location_on),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Digite seu CEP",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}