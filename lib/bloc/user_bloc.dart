import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';


class UserBloc extends BlocBase{

  final nameController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();
  final addressController = BehaviorSubject<String>();
  final birthdayController = BehaviorSubject<String>();
  final cepController = BehaviorSubject<String>();

  Stream<String> get outName => nameController.stream;
  Stream<String> get outEmail => emailController.stream;
  Stream<String> get outAddress => addressController.stream;
  Stream<String> get outBirthday => birthdayController.stream;
  Stream<String> get outCep => cepController.stream;

  User? firebaseUser;
  Map<String, dynamic> userData = {};
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveUser(String name, String password, String email, String cep, String birthday, String address)async {
    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "CEP": cep,
      "birthday": birthday,
      "address": address,
    };

    FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).set(userData);
  }

  void singUp(Map<String, dynamic> userData, String password,){
    auth.createUserWithEmailAndPassword(
      email: userData["email"], 
      password: password
    );
  }
}