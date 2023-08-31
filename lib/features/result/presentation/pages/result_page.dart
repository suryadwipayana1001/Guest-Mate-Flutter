import 'package:flutter/material.dart';
import 'package:forecasting/core/presentation/providers/core_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';

class ResultPage extends StatefulWidget {
  String title;
  int index;
  ResultPage({super.key, required this.title, required this.index});
  static const String routeName = '/result';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List _imageList = [male, female, hobby, maried, child];
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(sizeLarge),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    logo,
                    height: 150,
                  ),
                ),
                mediumVerticalSpacing(),
                Text(
                  widget.title,
                  style: whiteTitleTextStyle,
                ),
                mediumVerticalSpacing(),
                Container(
                  padding: EdgeInsets.all(sizeMedium),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: border, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  width: SizeConfig(context).appWidth(100),
                  child: Column(
                    children: [
                      Image.asset(
                        _imageList[widget.index],
                        width: 180,
                      ),
                      mediumVerticalSpacing(),
                      Text(
                        provider.result.toString(),
                        style: titleTextStyle,
                      ),
                      mediumVerticalSpacing(),
                      CustomButton(
                        text: appLoc.back,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                largeVerticalSpacing(),
                CustomVersion()
              ],
            ),
          ),
        )),
      );
    });
  }
}
