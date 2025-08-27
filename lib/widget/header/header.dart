// File: lib/widget/header/header.dart

import 'package:flutter/material.dart';

// Ubah menjadi StatelessWidget dan implementasikan PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  // Ini wajib ada saat membuat AppBar kustom
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}