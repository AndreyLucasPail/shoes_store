import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, this.image, this.text});

  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 1, 5),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: Image.asset(image!),
              ),
              const SizedBox(width: 10,),
              Text(
                text!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}