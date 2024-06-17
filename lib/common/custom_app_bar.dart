import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final Widget? actions;
  const CustomAppBar({super.key, required this.title, required this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      centerTitle: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      actions: [
        if (actions != null) actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}