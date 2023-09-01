import 'package:flutter/material.dart';
import 'package:forecasting/core/presentation/providers/core_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/presentation/widgets/custom_dropdown.dart';
import 'form_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const String routeName = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final session = locator<Session>();

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Consumer<CoreProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(sizeLarge),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          logo,
                          height: 200,
                        ),
                      ),
                      Text(
                        appLoc.appName,
                        style: whiteTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                CustomDropdown(
                  value: provider.languageList[session.isIndex],
                  dropdownList: provider.languageList,
                  title: appLoc.selectLanguage,
                  onChanged: (value) {
                    provider.setLanguage = value;
                    session.setLanguage = value!.value;
                    session.setIndexLanguage = value.index;
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(sizeLarge),
          child: CustomButton(
            text: appLoc.start,
            onPressed: () {
              provider.initializeRewardAd();

              Navigator.pushNamed(context, FormPage.routeName);
            },
          ),
        ),
      );
    });
  }
}
