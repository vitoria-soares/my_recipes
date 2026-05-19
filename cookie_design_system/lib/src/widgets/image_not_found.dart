import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://www.food4fuel.com/wp-content/uploads/woocommerce-placeholder-600x600.png',
      fit: BoxFit.cover,
    );
  }
}
