import 'package:flutter/material.dart';
import 'package:shoes_store/ui/home/homepage.dart';
import 'package:shoes_store/utils/colors/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const tag = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, HomePage.tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.midNigthBlue,
      body: body(),
    );
  }

  Widget body() {
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width *
                      0.6 *
                      _animationController!.value,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pngwing2.com.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50 * _animationController!.value,
                  child: const Text(
                    "Sneakers Shoes Store",
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
