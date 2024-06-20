import 'package:flutter/material.dart';

class AdsTile extends StatelessWidget {
  const AdsTile({super.key, this.image, this.height, this.width, this.radius});

  final String? image;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image!)),
        borderRadius: BorderRadius.circular(0)
      ),
    );
  }
}