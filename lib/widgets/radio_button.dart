import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: whiteBackgroundColor,
        border: Border.all(color: lightGreyColor, width: 2),
      ),
      child: selected
          ? const CircleAvatar(
              radius: 8,
              backgroundColor: navyPrimaryColor,
            )
          : null,
    );
  }
}
