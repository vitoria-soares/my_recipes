import 'package:flutter/material.dart';

class CookieCard extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  const CookieCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
      ),
    );
  }
}
