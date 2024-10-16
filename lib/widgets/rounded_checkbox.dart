import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yettel_homework/theme/colors.dart';

class RoundedCheckbox extends StatelessWidget {
  const RoundedCheckbox({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: selected ? lightGreyColor : whiteBackgroundColor,
        border: Border.all(color: lightGreyColor, width: 2),
      ),
      child:
          selected ? SvgPicture.asset('assets/images/check-thick.svg') : null,
    );
  }
}
