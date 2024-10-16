import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yettel_homework/theme/text_styles.dart';
import 'package:yettel_homework/utils/di/injectable.dart';
import 'package:yettel_homework/utils/navigation/router.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter _router = getIt();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => 'Yettel E-matrica',
      theme: appTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      routerConfig: _router.config(),
    );
  }
}
