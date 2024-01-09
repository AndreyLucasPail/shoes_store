// ignore_for_file: no_logic_in_create_state

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/model/produtc_model.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.product});

  final ProductsData? product;

  @override
  State<ProductTab> createState() => _ProductTabState(product);
}

class _ProductTabState extends State<ProductTab> {
  _ProductTabState(this.product);

  final ProductsData? product;
  String? size;

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
            padding: const EdgeInsets.fromLTRB(4, 10, 2, 4),
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
                const SizedBox(height: 4,),
                SizedBox(
                  height: 35,
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, 
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: product!.sizes!.map((sizeButtonText) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = sizeButtonText;
                          });
                        },
                        child: Container(
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: sizeButtonText == size ? Colors.orange : Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            sizeButtonText,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 34,),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 24, 94),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {}, 
                    child: const Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 34,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Descrição:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${product!.description}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),                
              ],
            ),
          ),
        ],
      ),
    );
  }
}