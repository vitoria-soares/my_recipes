import 'package:cookie_design_system/src/constants/images/cookie_images.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      CookieImages.placeholder,
      package: 'cookie_design_system',
      fit: BoxFit.cover,
    );
  }
}
