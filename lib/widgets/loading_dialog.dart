import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';

Future<void> showLoadingDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(color: limePrimaryColor),
          ),
        ),
      );
    },
  );
}
