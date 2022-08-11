import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';

class CookieCard extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final void Function()? onTap;
  const CookieCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.22,
      width: size.width * 0.85,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: CookieColors.orange,
          child: Center(
            child: ListTile(
              leading: leading,
              title: title,
              subtitle: subtitle,
            ),
          ),
        ),
      ),
    );
  }
}
