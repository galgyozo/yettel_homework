import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return lightGreyColor;
            }
            return navyPrimaryColor;
          },
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textTheme.headlineSmall?.copyWith(color: whiteBackgroundColor),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return OutlinedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(whiteBackgroundColor),
        padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: navyPrimaryColor,
            width: 2,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textTheme.headlineSmall,
      ),
    );
  }
}
