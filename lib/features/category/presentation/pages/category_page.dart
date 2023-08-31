import 'package:flutter/material.dart';
import 'package:forecasting/core/presentation/providers/core_provider.dart';
import 'package:forecasting/features/result/presentation/pages/result_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/loading_provider.dart';
import '../../../../core/presentation/providers/result_state.dart';
import '../widgets/category_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});
  static const String routeName = '/category';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> _categoryName = [
    appLoc.partnerName,
    appLoc.partnerCriteria,
    appLoc.weddingDate,
    appLoc.childName
  ];
  List<String> _categoryDescription = [
    appLoc.guessPartnerName,
    appLoc.guessPartnerCriteria,
    appLoc.guessPartnerCriteria,
    appLoc.guessGetMarried,
    appLoc.guessFutureChild
  ];
  List<String> type = [
    "nama-jodoh",
    "pekerjaan-jodoh",
    "tanggal-nikah",
    "nama-anak"
  ];
  @override
  Widget build(BuildContext context) {
    final loader = context.read<LoadingProvider>();
    return Consumer<CoreProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: context.watch<LoadingProvider>().state == true
              ? CustomLoading()
              : Padding(
                  padding: const EdgeInsets.all(sizeLarge),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          logo,
                          height: 150,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _categoryName.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.fetch(type[index]).listen(
                                      (state) async {
                                        if (provider.rewardAd == null) {
                                          customToast(appLoc.adsWait);
                                          provider.initializeRewardAd();
                                          return;
                                        }

                                        provider.rewardAd!
                                            .show(
                                                onUserEarnedReward:
                                                    (AdWithoutView ad,
                                                        RewardItem
                                                            rewardItem) {})
                                            .then((value) {
                                          switch (state.runtimeType) {
                                            case ResultLoading:
                                              loader.show();
                                              break;
                                            case ResultSuccess:
                                              loader.hide();
                                              Navigator.pushNamed(
                                                locator<
                                                        GlobalKey<
                                                            NavigatorState>>()
                                                    .currentContext!,
                                                ResultPage.routeName,
                                                arguments: {
                                                  "title": _categoryName[index],
                                                  "index": index == 0
                                                      ? provider.isSelectedGender ==
                                                              0
                                                          ? 1
                                                          : 0
                                                      : index + 1
                                                },
                                              );
                                              printWarning(
                                                  "SUKSESS AMBIL DATA");
                                              break;
                                            case ResultFailure:
                                              loader.hide();

                                              final error =
                                                  (state as ResultFailure)
                                                      .error
                                                      .message;
                                              customToast(error);
                                              printError("error $error");
                                          }
                                        });
                                      },
                                    );
                                  },
                                  child: CategoryItem(
                                      title: _categoryName[index],
                                      description: _categoryDescription[index]),
                                ),
                                mediumVerticalSpacing(),
                              ],
                            );
                          },
                        ),
                      ),
                      // CustomButton(
                      //   text: appLoc.reset,
                      //   onPressed: () {
                      //     Navigator.pushNamedAndRemoveUntil(
                      //       context,
                      //       LandingPage.routeName,
                      //       (route) => false,
                      //     );
                      //   },
                      // ),
                      mediumVerticalSpacing(),
                      CustomVersion(),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
