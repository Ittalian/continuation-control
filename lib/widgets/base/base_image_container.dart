import 'package:flutter/material.dart';

class BaseImageContainer extends StatelessWidget {
  final String imagePath;
  final Widget child;
  const BaseImageContainer({
    super.key,
    required this.imagePath,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}