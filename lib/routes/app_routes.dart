import 'package:flutter/material.dart';
import 'package:shoes_store/ui/shoes_screen/shoes_screen.dart';
import 'package:shoes_store/ui/cart/cart_screen.dart';
import 'package:shoes_store/ui/edit-user/edit_user.dart';
import 'package:shoes_store/ui/home/homepage.dart';
import 'package:shoes_store/ui/login/login_screen.dart';
import 'package:shoes_store/ui/products/products_screen.dart';
import 'package:shoes_store/ui/singUp/singup_screen.dart';
import 'package:shoes_store/ui/orders/orders_screen.dart';
import 'package:shoes_store/ui/splash/splash_screen.dart';
import 'package:shoes_store/ui/track_order/track_order_screen.dart';
import 'package:shoes_store/ui/user/user_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    Widget screen = getScreenNullable(settings) ?? const SplashScreen();

    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }

  static Widget? getScreenNullable(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.tag:
        return const SplashScreen();
      case HomePage.tag:
        return const HomePage();
      case ShoesScreen.tag:
        ShoesScreenArgs args;

        args = settings.arguments as ShoesScreenArgs;

        return ShoesScreen(
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
      case TrackOrderScreen.tag:
        TrackOrderScreenArgs args;

        args = settings.arguments as TrackOrderScreenArgs;

        return TrackOrderScreen(order: args.order);
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
