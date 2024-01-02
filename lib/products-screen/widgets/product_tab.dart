// ignore_for_file: no_logic_in_create_state

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/data/produtcs_data.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.product});

  final ProductsData? product;

  @override
  State<ProductTab> createState() => _ProductTabState(product);
}

class _ProductTabState extends State<ProductTab> {
  _ProductTabState(this.product);

  final ProductsData? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        centerTitle: true,
        title: const Text("SNKRS"),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                reverse: true,
                height: 400,
                enlargeCenterPage: true,
              ),
              items: product!.images!.map((url) {
                return Image.network(url, fit: BoxFit.cover,);
              }).toList(),            
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "${product!.name}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tamanhos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, 
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}