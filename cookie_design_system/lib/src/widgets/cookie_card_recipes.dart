import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';

class CookieCardRecipes extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final void Function()? onTap;
  const CookieCardRecipes({
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
          clipBehavior: Clip.hardEdge,
          color: CookieColors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 30,
                child: Visibility(
                  visible: leading != null,
                  child: leading!,
                  replacement: const SizedBox.shrink(),
                ),
              ),
              Expanded(
                flex: 70,
                child: ListTile(
                  title: title,
                  subtitle: subtitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
