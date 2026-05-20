import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';

class CookieAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final bool? centerTittle;
  final String title;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const CookieAppBar({
    super.key,
    this.backgroundColor,
    this.centerTittle = true,
    this.leading,
    this.automaticallyImplyLeading = true,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: backgroundColor ?? CookieColors.orange,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: CookieRadius.lg,
        ),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      centerTitle: centerTittle,
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
    );
  }
}
