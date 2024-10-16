import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yettel_homework/utils/di/injectable.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(Application());
}
