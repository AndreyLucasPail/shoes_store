import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key, this.products});

  final ProductsData? products;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Image.network(
              products!.images![0],
              fit: BoxFit.cover,
            ),
          ),

        ],
      ),
    );
  }
}