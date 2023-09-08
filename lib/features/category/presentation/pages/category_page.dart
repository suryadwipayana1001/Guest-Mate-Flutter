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

final session = locator<Session>();

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

  @override
  Widget build(BuildContext context) {
    final loader = locator<GlobalKey<NavigatorState>>()
        .currentContext!
        .read<LoadingProvider>();
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
                                    if (index == 0) {
                                      fetchData(provider, loader, index,
                                          _categoryName, session.isOpenName);
                                    } else if (index == 1) {
                                      fetchData(
                                          provider,
                                          loader,
                                          index,
                                          _categoryName,
                                          session.isOpenCriteria);
                                    } else if (index == 2) {
                                      fetchData(provider, loader, index,
                                          _categoryName, session.isOpenWedding);
                                    } else if (index == 3) {
                                      fetchData(provider, loader, index,
                                          _categoryName, session.isOpenChild);
                                    }
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
                      CustomButton(
                        text: appLoc.reset,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
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

void fetchData(CoreProvider provider, LoadingProvider loader, int index,
    List<String> _categoryName, bool isOpen) {
  List<String> type = [
    "nama-jodoh",
    "pekerjaan-jodoh",
    "tanggal-nikah",
    "nama-anak"
  ];
  if (isOpen == false) {
    provider.fetch(type[index]).listen(
      (state) async {
        // if (provider.rewardAd == null) {
        //   customToast(appLoc.adsWait);
        //   provider.initializeRewardAd();
        //   return;
        // }
        // provider.rewardAd!
        //     .show(
        //         onUserEarnedReward:
        //             (AdWithoutView ad, RewardItem rewardItem) {})
        //     .then(
        //   (value) {
        switch (state.runtimeType) {
          case ResultLoading:
            loader.show();
            break;
          case ResultSuccess:
            if (index == 0) {
              session.setResultName = provider.result.toString();
              session.setIsOpenName = true;
            } else if (index == 1) {
              session.setResultCriteria = provider.result.toString();
              session.setIsOpenCriteria = true;
            } else if (index == 2) {
              session.setResultWedding = provider.result.toString();
              session.setIsOpenWedding = true;
            } else if (index == 3) {
              session.setResultChild = provider.result.toString();
              session.setIsOpenChild = true;
            }
            Navigator.pushNamed(
              locator<GlobalKey<NavigatorState>>().currentContext!,
              ResultPage.routeName,
              arguments: {
                "title": _categoryName[index],
                "index": index == 0
                    ? provider.isSelectedGender == 0
                        ? 1
                        : 0
                    : index + 1
              },
            );
            loader.hide();
            break;
          case ResultFailure:
            loader.hide();

            final error = (state as ResultFailure).error.message;
            customToast(error);
        }
      },
    );
    //   },
    // );
  } else {
    if (index == 0) {
      provider.setResult = session.resultName;
    } else if (index == 1) {
      provider.setResult = session.resultCriteria;
    } else if (index == 2) {
      provider.setResult = session.resultWedding;
    } else if (index == 3) {
      provider.setResult = session.resultChild;
    }
    Navigator.pushNamed(
      locator<GlobalKey<NavigatorState>>().currentContext!,
      ResultPage.routeName,
      arguments: {
        "title": _categoryName[index],
        "index": index == 0
            ? provider.isSelectedGender == 0
                ? 1
                : 0
            : index + 1
      },
    );
  }
}
