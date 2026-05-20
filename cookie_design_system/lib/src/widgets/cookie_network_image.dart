import 'package:cookie_design_system/src/constants/colors/cookie_colors.dart';
import 'package:cookie_design_system/src/widgets/image_not_found.dart';
import 'package:flutter/material.dart';

class CookieNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const CookieNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // return ImageNotFound();
    return Image.network(
      imageUrl,
      fit: fit,
      errorBuilder: (context, object, stackTrace) {
        return const ImageNotFound();
      },
      loadingBuilder: (context, child, event) {
        if (event == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            color: CookieColors.yellow,
            value: event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        );
      },
    );
  }
}
