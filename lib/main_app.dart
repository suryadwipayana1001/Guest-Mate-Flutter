import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:forecasting/core/presentation/providers/loading_provider.dart';
import 'package:forecasting/features/result/presentation/providers/result_provider.dart';
import 'package:provider/provider.dart';
import 'core/core.dart';
import 'core/route/route.dart' as router;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingProvider>(
            create: (_) => locator<LoadingProvider>()),
        ChangeNotifierProvider<LandingProvider>(
            create: (_) => locator<LandingProvider>()),
        ChangeNotifierProvider<ResultProvider>(
            create: (_) => locator<ResultProvider>()),
      ],
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: locator<GlobalKey<NavigatorState>>(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const SplashPage(),
        );
      },
    );
  }
}
