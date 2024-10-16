import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar({
    super.key,
    required this.title,
    this.fontSize = 16,
  });

  final String title;
  final double fontSize;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontSize: fontSize,
        ),
      ),
      centerTitle: false,
      titleSpacing: context.router.canPop() ? 0 : 30,
      iconTheme: theme.iconTheme.copyWith(
        size: 22,
        color: navyPrimaryColor,
      ),
      backgroundColor: theme.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }
}
