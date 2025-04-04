import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/mixins/orders_mixin.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/ui/orders/widgets/order_tile.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const tag = "/orderScreen";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with OrdersMixin {
  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();
    ordersBloc = OrdersBloc();

    ordersBloc.loadOrders();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userBloc.loadCurrentUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      appBar: AppBar(
        backgroundColor: CustomColors.midNigthBlue,
        iconTheme: const IconThemeData(
          color: CustomColors.white,
        ),
        title: const Text(
          "Pedidos",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return StreamBuilder<List<OrderModel>>(
      stream: ordersBloc.streamOrder,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!userBloc.isLoggedIn()) {
          return userNotLogged();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return emptyOrder();
        } else {
          List<OrderModel> ordersList = snapshot.data!;

          return ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              return OrderTile(
                order: ordersList[index],
              );
            },
          );
        }
      },
    );
  }

  Widget userNotLogged() {
    return Container(
      color: CustomColors.grey200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.person_off_sharp,
            color: CustomColors.midNigthBlue,
            size: 120,
          ),
          const SizedBox(height: 20),
          const Text(
            "Entre para acompanhar seus pedidos.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColors.midNigthBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.tag);
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: CustomColors.midNigthBlue,
              ),
              child: const Text(
                "Entrar",
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyOrder() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.remove_road,
            size: 120,
            color: CustomColors.midNigthBlue,
          ),
          SizedBox(height: 20),
          Text(
            "Nenhum pedido para acompanhar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: CustomColors.midNigthBlue,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
