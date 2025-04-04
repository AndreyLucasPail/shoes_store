import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin OrdersMixin {
  late OrdersBloc ordersBloc;
  UserBloc userBloc = UserBloc();
}
