import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/model/cart_model.dart';

class CartBloc extends BlocBase{
  
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  List<CartModel> product = [];
  UserBloc? user;

  final cartController = BehaviorSubject<List<CartModel>>.seeded([]);

  Stream<List<CartModel>> get cartStream => cartController.stream;

  Future<void> addCartItem(CartModel cartProduct) async {

    product.add(cartProduct);

    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){  
      print("Dados do carrinho: ${cartProduct.toMap()}");
      await firebase
        .collection("Users")
        .doc(user.uid)
        .collection("cart")
        .add(cartProduct.toMap()).then((doc) {
          cartProduct.cId = doc.id;
          print("Item adicionado ao carrinho com ID: ${doc.id}");
      });
      print("USUARIO: $user");
    }else{
      print("nenhum usuario encontrado");
    }

    cartController.sink.add(product); 
    print("Estado do stream após adicionar itens: ${cartController.value}");   
  }

  Future<void> loadCartItem(UserBloc userBloc) async {
    
    user = userBloc;

  if(user != null && user!.firebaseUser != null){
      QuerySnapshot querySnapshot = await firebase
        .collection("Users")
        .doc(user!.firebaseUser!.uid)
        .collection("cart")
        .get();

      product = querySnapshot.docs.map((doc) => CartModel.fromFirestore(doc)).toList();
      
      print("Número de itens no carrinho: ${product.length}");

      cartController.sink.add(product);
      print("Estado do stream após carregar itens: ${cartController.value}");
    }

  }

  @override
  void dispose() {
    super.dispose();

    cartController.close();
  }

}