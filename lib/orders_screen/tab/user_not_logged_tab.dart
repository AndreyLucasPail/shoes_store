import 'package:flutter/material.dart';
import 'package:shoes_store/home/screens/login_screen.dart';

class UserNotLogeedIn extends StatelessWidget {
  const UserNotLogeedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.person_off_sharp,
            color: Color.fromARGB(255, 38, 24, 94),
            size: 120,
          ),
          const SizedBox(height: 20,),
          const Text(
            "Entre para acompanhar seus pedidos.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 38, 24, 94),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 38, 24, 94),
              ), 
              child: const Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}