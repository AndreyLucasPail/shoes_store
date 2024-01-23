import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/orders_screen/tile/order_tile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  late OrdersBloc ordersBloc;

  @override
  void initState() {
    super.initState();

    ordersBloc = OrdersBloc();

    ordersBloc.loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 24, 94),
        title: const Text("SNKRS"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: ordersBloc.streamOrder,
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
    
            List<OrderModel> ordersList = snapshot.data!;
            
            return ListView.builder(
              itemCount: ordersList.length,
              itemBuilder: (context, index){
                return OrderTile(order: ordersList[index],);
              }
            );
          }
        }
      ),
    );
  }
}