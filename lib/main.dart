import 'package:flutter/material.dart';
import 'package:forecasting/main_app.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await locatorInit();
    locator.isReady<Session>().then((_) async {
      return runApp(const MainApp());
    });
  } catch (e) {
    logMe(e);
  }
}
