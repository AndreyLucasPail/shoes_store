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
        children: [(products != null && products!.images != null && products!.images!.isNotEmpty ?
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(products!.images![0])),
            ),
          ) : Container()
          ),

        ],
      ),
    );
  }
}