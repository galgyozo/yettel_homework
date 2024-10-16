import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/widgets/button.dart';

@RoutePage()
class ConfirmOrderSuccessScreen extends StatelessWidget {
  const ConfirmOrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: limePrimaryColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/images/run.png'),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: PrimaryButton(
                    text: 'Rendben',
                    onPressed: context.router.popUntilRoot,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'A matricákat sikeresen kifizetted!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 40),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/confetti.png'),
            ),
          ],
        ),
      ),
    );
  }
}
