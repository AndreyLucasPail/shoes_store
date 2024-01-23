import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/orders_screen/tile/order_tile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, this.orderId});

  final String? orderId;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  OrdersBloc ordersBloc = OrdersBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ordersBloc.streamOrder,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.builder(
            itemBuilder: (context, index){
              return OrderTile();
            }
          );
        }
      }
    );
  }
}