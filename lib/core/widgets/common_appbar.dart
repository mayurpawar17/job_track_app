import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final bool showBackButton; // New flag to toggle visibility

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackTap,
    this.showBackButton = true, // Defaults to true for most sub-pages
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      // If showBackButton is false, we set leading to null and prevent
      // Flutter from automatically adding a back button.
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.secondary,
                size: 20,
              ),
              onPressed: onBackTap ?? () => Navigator.maybePop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions:
          actions ??
          [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Color(0xFF0D1B3E)),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
