import 'package:flutter/material.dart';

class CookieBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CookieBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}
