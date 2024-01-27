import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/order_model.dart';
import 'package:shoes_store/orders_screen/tab/user_not_logged_tab.dart';
import 'package:shoes_store/orders_screen/tile/order_tile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  late OrdersBloc ordersBloc;
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    userBloc = UserBloc();
    ordersBloc = OrdersBloc();

    ordersBloc.loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          }else if(!userBloc.isLoggedIn()){
            return const UserNotLogeedIn();
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