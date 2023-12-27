import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key, this.category, this.brand, required this.products});

  final String? category;
  final String? brand;
  final ProductsData? products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(products!.images![0]),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("${products!.name}")
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("R\$ ${products!.price}")
              )
            ],
          ),
        ),
      ),
    );
  }
}