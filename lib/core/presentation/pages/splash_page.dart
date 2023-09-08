import 'package:flutter/material.dart';
import 'package:forecasting/core/core.dart';
import 'package:forecasting/core/presentation/providers/core_provider.dart';
import 'package:forecasting/features/landing/presentation/pages/landing_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    int delay = 3;
    Future.delayed(
      Duration(seconds: delay),
      () => {Navigator.pushReplacementNamed(context, LandingPage.routeName)},
    );
    // context.read<CoreProvider>().initializeRewardAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: 200,
              ),
              Text(
                appLoc.appName,
                style: landingTextSyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
