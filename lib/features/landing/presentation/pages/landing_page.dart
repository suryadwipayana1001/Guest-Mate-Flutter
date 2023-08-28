import 'package:flutter/material.dart';
import 'package:forecasting/core/presentation/providers/loading_provider.dart';
import 'package:forecasting/core/presentation/widgets/custom_dropdown.dart';
import 'package:forecasting/features/result/presentation/pages/result_page.dart';
import 'package:forecasting/features/result/presentation/providers/result_provider.dart';
import 'package:forecasting/features/result/presentation/providers/result_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const String routeName = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LandingProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: primary,
          body: SafeArea(
            child: context.watch<LoadingProvider>().state == true
                ? CustomLoading()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(paddingSizeLarge),
                      child: Form(
                        key: provider.formKey,
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                logo,
                                height: 150,
                              ),
                            ),
                            CustomTextField(
                              controller: provider.nameController,
                              title: 'Nama',
                              fieldValidator: ValidationHelper(
                                isError: (error) =>
                                    provider.setNameError = error,
                                typeField: TypeField.none,
                              ).validate(),
                            ),
                            CustomDropdown(
                                title: 'Jenis Kelamin',
                                value: provider.gender,
                                onChanged: (String? value) {
                                  provider.setGender = value;
                                },
                                dropdownList: provider.jenisKelaminList),
                            CustomTextField(
                              inputType: TextInputType.number,
                              controller: provider.ageController,
                              title: 'Umur',
                              fieldValidator: ValidationHelper(
                                isError: (error) =>
                                    provider.setAgeError = error,
                                typeField: TypeField.number,
                              ).validate(),
                            ),
                            CustomTextField(
                              maxLines: 6,
                              controller: provider.hobbyController,
                              title: 'Hobi',
                              fieldValidator: ValidationHelper(
                                isError: (error) =>
                                    provider.setHobbiyError = error,
                                typeField: TypeField.none,
                              ).validate(),
                            ),
                            largeVerticalSpacing(),
                            CustomButton(
                              text: 'MULAI',
                              onPressed: () {
                                final resultProvider =
                                    context.read<ResultProvider>();
                                final loader = context.read<LoadingProvider>();
                                if (provider.formKey.currentState!.validate()) {
                                  resultProvider.setSelectedCategoryIndex = 0;
                                  if (resultProvider.rewardAd == null) {
                                    customToast(
                                        "Harap tunggu, kami sedang menyiapkan iklan, silakan coba lagi");
                                    resultProvider.initializeRewardAd();
                                    return;
                                  }
                                  print(resultProvider.rewardAd.toString());
                                  resultProvider.rewardAd!
                                      .show(
                                          onUserEarnedReward: (AdWithoutView ad,
                                              RewardItem rewardItem) {})
                                      .then((value) {
                                    resultProvider.fetchResult(provider).listen(
                                      (state) async {
                                        switch (state.runtimeType) {
                                          case ResultLoading:
                                            loader.show();
                                            printWarning('loading...');
                                            break;
                                          case ResultSuccess:
                                            loader.hide();
                                            printWarning('success...');
                                            Navigator.pushNamed(
                                                context, ResultPage.routeName);
                                            break;
                                          case ResultFailure:
                                            loader.hide();
                                            final error =
                                                (state as ResultFailure)
                                                    .error
                                                    .message;
                                            // customToast(error);
                                            printError(error);
                                        }
                                      },
                                    );
                                  });
                                }
                              },
                            ),
                            largeVerticalSpacing(),
                            CustomVersion()
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
