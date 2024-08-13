// ignore_for_file: no_logic_in_create_state

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/model/cart_model.dart';
import 'package:shoes_store/model/produtc_model.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class ShoesScreenArgs {
  ShoesScreenArgs({
    required this.brand,
    required this.category,
    required this.product,
  });
  final ProductsModel? product;
  final String? category;
  final String? brand;
}

class ShoesScreen extends StatefulWidget {
  const ShoesScreen({
    super.key,
    required this.product,
    required this.category,
    required this.brand,
  });

  static const tag = "/productScreen";

  final ProductsModel? product;
  final String? category;
  final String? brand;

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  _ShoesScreenState();

  late UserBloc userBloc;

  String? size;
  bool activeButton = false;
  CartBloc? cartBloc = CartBloc();
  NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc();
    cartBloc = CartBloc();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userBloc.loadCurrentUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey200,
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        centerTitle: true,
        title: const Text("SNKRS"),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            carouselImages(),
            shoeInfo(),
            sizesGrid(),
            addCartButton(),
            shoeDescription(),
          ],
        ),
      ),
    );
  }

  Widget carouselImages() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AspectRatio(
        aspectRatio: 0.9,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            reverse: true,
            height: 400,
            enlargeCenterPage: true,
          ),
          items: widget.product!.images!.map((url) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget shoeInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        children: [
          Text(
            "${widget.product!.name}",
            style: const TextStyle(
              color: CustomColors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "Preço",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 36),
              Text(
                "R\$ ${formatNumber.format(widget.product!.price)}",
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizesGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tamanhos",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 4),
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
              children: widget.product!.sizes!.map((sizeButtonText) {
                return InkWell(
                  onTap: () {
                    setState(
                      () {
                        size = sizeButtonText;
                        size == sizeButtonText
                            ? activeButton = !activeButton
                            : activeButton;
                      },
                    );
                  },
                  child: Container(
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: size == sizeButtonText
                          ? CustomColors.midNigthBlue
                          : Colors.grey[100],
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                        color: size == sizeButtonText
                            ? CustomColors.midNigthBlue
                            : CustomColors.black,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      sizeButtonText,
                      style: TextStyle(
                        color: sizeButtonText == size
                            ? Colors.white
                            : CustomColors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget addCartButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.midNigthBlue,
            shape: const StadiumBorder(),
          ),
          onPressed: size != null
              ? () async {
                  if (!userBloc.isLoggedIn()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  } else {
                    CartModel cartProduct = CartModel();
                    cartProduct.category = widget.category;
                    cartProduct.productId = widget.product!.id;
                    cartProduct.brand = widget.brand;
                    cartProduct.quantity = 1;
                    cartProduct.size = size;
                    cartProduct.price = widget.product!.price;
                    cartProduct.imgCart = widget.product!.images![0];
                    cartProduct.model = widget.product!.name;

                    await cartBloc!.addCartItem(cartProduct);

                    cartSuccess();
                  }
                }
              : null,
          child: const Text(
            "Adicionar ao Carrinho",
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget shoeDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Descrição:",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "${widget.product!.description}",
              style: const TextStyle(
                fontSize: 18,
                color: CustomColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cartSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: CustomColors.midNigthBlue,
        content: Text(
          "Pedido adicionado ao carrinho com sucesso!!",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.dispose();
  }
}
