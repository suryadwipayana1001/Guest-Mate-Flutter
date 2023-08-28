import 'package:flutter/material.dart';
import 'package:forecasting/core/core.dart';
import 'package:forecasting/features/landing/presentation/pages/landing_page.dart';
import 'package:forecasting/features/result/presentation/providers/result_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
    context.read<ResultProvider>().initializeRewardAd();
    int delay = 3;
    Future.delayed(
      Duration(seconds: delay),
      () => {Navigator.pushReplacementNamed(context, LandingPage.routeName)},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                'Tebak Jodoh',
                style: landingTextSyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
