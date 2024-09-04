// AppBar(title: Text(component.attributes['title'] ?? ''));

import 'package:flutter/material.dart';

class DyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DyAppBar({
    super.key,
    required this.screenHeight,
    required this.title,
  });
  final double screenHeight;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [],
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(title),
      toolbarHeight: screenHeight / 15.07,
    );
  }
}
