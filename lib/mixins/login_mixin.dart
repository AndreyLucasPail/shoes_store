import 'package:flutter/material.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin LoginMixin {
  UserBloc userBloc = UserBloc();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
