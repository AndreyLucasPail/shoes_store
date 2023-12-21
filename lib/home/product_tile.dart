import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key, this.products});

  final ProductsData? products;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [(products != null && products!.images != null && products!.images!.isNotEmpty ?
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 155,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(products!.images![0])),
            ),
          ) : Container()
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${products!.price}",
              style: const TextStyle(fontSize: 20),
            )
          ), 
        ],
      ),
    );
  }
}