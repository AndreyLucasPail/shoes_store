import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:shoes_store/bloc/validators/validator.dart';

class LoginBloc extends BlocBase with Validator{

  FirebaseAuth auth = FirebaseAuth.instance;

  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail => emailController.stream.transform(validateEmail);
  Stream<String> get outpass => passwordController.stream.transform(validatePassword);

  void login(String email, String password){
    auth.signInWithEmailAndPassword(
      email: email, password: password
    ).then((user){

    }).catchError((e){
      
    });
  }
}