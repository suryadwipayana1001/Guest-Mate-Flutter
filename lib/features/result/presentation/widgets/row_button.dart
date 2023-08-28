import 'package:flutter/material.dart';
import 'package:forecasting/features/result/presentation/providers/result_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../core/presentation/providers/loading_provider.dart';
import '../providers/result_state.dart';

class RowButton extends StatefulWidget {
  const RowButton({super.key});

  @override
  State<RowButton> createState() => _RowButtonState();
}

class _RowButtonState extends State<RowButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Kembali',
            onPressed: () {
              Navigator.pop(context);
            },
            height: 40,
          ),
        ),
        largeHorizontalSpacing(),
        Expanded(
          child: CustomButton(
            text: 'Coba Lagi',
            onPressed: () {
              final provider = context.read<ResultProvider>();
              final loader = context.read<LoadingProvider>();
              final landingProvider = context.read<LandingProvider>();
              if (provider.rewardAd == null) {
                customToast(
                    "Harap tunggu, kami sedang menyiapkan iklan, silakan coba lagi");
                provider.initializeRewardAd();
                return;
              }
              print(provider.rewardAd.toString());
              provider.rewardAd!
                  .show(
                      onUserEarnedReward:
                          (AdWithoutView ad, RewardItem rewardItem) {})
                  .then((value) {
                provider.fetchResult(landingProvider).listen(
                  (state) async {
                    switch (state.runtimeType) {
                      case ResultLoading:
                        loader.show();
                        printWarning('loading...');
                        break;
                      case ResultSuccess:
                        loader.hide();
                        printWarning('success...');
                        break;
                      case ResultFailure:
                        loader.hide();
                        final error = (state as ResultFailure).error.message;
                        customToast(error);
                        printError(error);
                    }
                  },
                );
              });
            },
            height: 40,
          ),
        )
      ],
    );
  }
}
