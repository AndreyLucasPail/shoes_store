import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:shoes_store/model/order_model.dart';

class OrdersBloc extends BlocBase{
  
  final orderController = BehaviorSubject();

  Stream get streamOrder => orderController.stream;

  List<OrderModel> orders = [];
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<void> loadOrders() async {
    User? user = FirebaseAuth.instance.currentUser; 

    if(user != null){
      QuerySnapshot query = await firebase.collection("Users")
        .doc(user.uid)  
        .collection("orders")
        .get();

      orders = query.docs.map((doc) => OrderModel.fromFirestore(doc)).toList();
    }

    orderController.sink.add(orders);
  }
}