import 'package:flutter/material.dart';
import 'package:shoes_store/ui/product_screen/product_screen.dart';
import 'package:shoes_store/ui/cart/screen/cart_screen.dart';
import 'package:shoes_store/ui/edit-user/edit_user.dart';
import 'package:shoes_store/ui/home/homepage.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/ui/products/products_screen.dart';
import 'package:shoes_store/ui/singUp/singup_screen.dart';
import 'package:shoes_store/ui/orders/screen/orders_screen.dart';
import 'package:shoes_store/ui/orders/screen/track_order_screen.dart';
import 'package:shoes_store/ui/user/user_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    Widget screen = getScreenNullable(settings) ?? const HomePage();

    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }

  static Widget? getScreenNullable(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.tag:
        return const HomePage();
      case ProductScreen.tag:
        ProductScreenArgs args;

        args = settings.arguments as ProductScreenArgs;

        return ProductScreen(
          product: args.product,
          brand: args.brand,
          category: args.category,
        );
      case LoginScreen.tag:
        return const LoginScreen();
      case SingUpScreen.tag:
        return const SingUpScreen();
      case OrderScreen.tag:
        return const OrderScreen();
      case TrackOrder.tag:
        return const TrackOrder();
      case ProductsScreen.tag:
        ProductsScreenArgs args;

        args = settings.arguments as ProductsScreenArgs;

        return ProductsScreen(
          brand: args.brand,
          category: args.category,
        );
      case UserScreen.tag:
        return const UserScreen();
      case EditUserScreen.tag:
        return const EditUserScreen();
      case CartScreen.tag:
        return const CartScreen();
      default:
        return null;
    }
  }
}
