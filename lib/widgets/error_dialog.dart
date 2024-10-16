import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yettel_homework/widgets/button.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String message,
  VoidCallback? onClose,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hiba'),
        content: Text(message),
        actions: [
          PrimaryButton(
            text: 'Rendben',
            onPressed: () {
              onClose?.call();
              context.router.popForced();
            },
          ),
        ],
      );
    },
  );
}
