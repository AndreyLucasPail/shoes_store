// ignore_for_file: no_logic_in_create_state

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/home/screens/login_screen.dart';
import 'package:shoes_store/model/cart_model.dart';
import 'package:shoes_store/model/produtc_model.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.product, required this.category, required this.brand,});

  final ProductsModel? product;
  final String? category;
  final String? brand;

  @override
  State<ProductTab> createState() => _ProductTabState(product, category, brand);
}

class _ProductTabState extends State<ProductTab> {
  _ProductTabState(this.product, this.category, this.brand);

  late UserBloc userBloc;

  final ProductsModel? product;
  final String? category; 
  final String? brand;
  String? size;
  CartBloc? cartBloc = CartBloc();
  NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc();
    cartBloc = CartBloc();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user != null){
        userBloc.loadCurrentUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                autoPlay: false,
                reverse: true,
                height: 400,
                enlargeCenterPage: true,
              ),
              items: product!.images!.map((url) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(url))
                  ),
                );
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
                const SizedBox(height: 12,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Preço",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  "R\$ ${formatNumber.format(product!.price)}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
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
                            color: sizeButtonText == size ? const Color.fromARGB(255, 38, 24, 94) : Colors.grey[300],
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color:sizeButtonText == size ? const Color.fromARGB(255, 38, 24, 94) : Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            sizeButtonText,
                            style: TextStyle(
                              color: sizeButtonText == size ? Colors.white : Colors.black,
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
                    onPressed: size != null ? () async {
                      if(!userBloc.isLoggedIn()){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginScreen())
                        );                        
                      }else{
                        CartModel cartProduct = CartModel();
                        cartProduct.category = category;
                        cartProduct.productId = product!.id;
                        cartProduct.brand = brand;
                        cartProduct.quantity = 1;                        
                        cartProduct.size = size;                        
                        cartProduct.price = product!.price;
                        cartProduct.imgCart = product!.images![0];
                        cartProduct.model = product!.name;

                        await cartBloc!.addCartItem(cartProduct);                   

                        cartSuccess();
                      }
                      
                    } : null, 
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

  void cartSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 38, 24, 94),
        content: Text(
          "Pedido adicionado com sucesso!!",
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.dispose();
  }
}