import 'package:flutter/material.dart';
import 'package:forecasting/features/category/presentation/pages/category_page.dart';
import 'package:forecasting/features/landing/presentation/pages/form_page.dart';
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
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
          builder: (_) => ResultPage(
                title: args['title'],
                index: args['index'],
              ));
    case CategoryPage.routeName:
      return MaterialPageRoute(builder: (_) => const CategoryPage());
    case FormPage.routeName:
      return MaterialPageRoute(builder: (_) => const FormPage());

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
