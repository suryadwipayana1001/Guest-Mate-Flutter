import 'package:flutter/material.dart';
import 'package:forecasting/features/result/presentation/pages/result_page.dart';
import '../core.dart';
import '../../features/landing/presentation/pages/landing_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case LandingPage.routeName:
      return MaterialPageRoute(builder: (_) => const LandingPage());
    case ResultPage.routeName:
      return MaterialPageRoute(builder: (_) => const ResultPage());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
