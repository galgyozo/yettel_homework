import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/utils/navigation/router.gr.dart';
import 'package:yettel_homework/widgets/app_bar.dart';
import 'package:yettel_homework/widgets/menu_item.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: const RoundedAppBar(
        title: 'Yettel',
        fontSize: 24,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MenuItem(
              title: 'E-matrica',
              onTap: () => context.router.push(const VignettesRoute()),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Stack(
              children: [
                Image.asset('assets/images/confetti.png'),
                Positioned(
                  bottom: 230,
                  right: 180,
                  child: Image.asset('assets/images/flutter_logo.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset('assets/images/run.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
