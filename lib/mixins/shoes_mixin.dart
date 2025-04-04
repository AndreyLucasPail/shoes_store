import 'package:intl/intl.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';

mixin ShoesMixin {
  late UserBloc userBloc;

  String? size;
  bool activeButton = false;
  CartBloc? cartBloc = CartBloc();
  NumberFormat formatNumber = NumberFormat("#,##0.00", "pt_BR");
}
