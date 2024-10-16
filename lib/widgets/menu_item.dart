import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/widgets/rounded_card.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: RoundedCard(
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 24,
              color: navyPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
