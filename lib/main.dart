import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shoes_store/bloc/cart_bloc.dart';
import 'package:shoes_store/bloc/orders_bloc.dart';
import 'package:shoes_store/bloc/user_bloc.dart';
import 'package:shoes_store/routes/app_routes.dart';
import 'package:shoes_store/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("22ff6f25-742c-4769-b4eb-2877c2d3aeca");
    OneSignal.Notifications.requestPermission(true);

    return BlocProvider(
      blocs: [
        Bloc((i) => CartBloc()),
        Bloc((i) => UserBloc()),
        Bloc((i) => OrdersBloc())
      ],
      dependencies: const [],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.tag,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
