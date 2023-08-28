import 'package:flutter/material.dart';
import 'package:forecasting/features/result/presentation/providers/result_provider.dart';
import 'package:forecasting/features/result/presentation/widgets/row_button.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/loading_provider.dart';
import '../providers/result_state.dart';
import '../widgets/category_item.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});
  static const String routeName = '/result';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: context.watch<LoadingProvider>().state == true
              ? CustomLoading()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(paddingSizeLarge),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'TEBAK JODOH',
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        largeVerticalSpacing(),
                        CustomContainer(
                            widget: Text(provider.resultGenerate.toString())),
                        largeVerticalSpacing(),
                        RowButton(),
                        largeVerticalSpacing(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: provider.title.length,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                (index == provider.selectedCategoryIndex);
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.setSelectedCategoryIndex = index;
                                    if (index == 0) {
                                      provider.seResultGenerate =
                                          provider.resultNama;
                                    } else if (index == 1) {
                                      provider.seResultGenerate =
                                          provider.resultKriteria;
                                    } else if (index == 2) {
                                      provider.seResultGenerate =
                                          provider.resultPekerjaan;
                                    } else if (index == 3) {
                                      provider.seResultGenerate =
                                          provider.resultTanggal;
                                    } else if (index == 4) {
                                      provider.seResultGenerate =
                                          provider.resultAnak;
                                    }
                                  },
                                  child: CategoryItem(
                                    title: provider.title[index],
                                    description: provider.subTitle[index],
                                    color: isSelected ? category : white,
                                  ),
                                ),
                                mediumVerticalSpacing(),
                              ],
                            );
                          },
                        ),
                        CustomVersion()
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
