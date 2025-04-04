import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin CartMixin {
  late CartBloc cartBloc;
  UserBloc userBloc = UserBloc();
}
