import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/core_provider.dart';
import '../../../../core/presentation/widgets/custom_dropdown.dart';
import '../../../category/presentation/pages/category_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  static const String routeName = '/form';
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final List<String> _genderList = <String>[appLoc.male, appLoc.female];
  String _gender = appLoc.male;
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: primary,
          body: SafeArea(
            child: SingleChildScrollView(
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
                        title: appLoc.name,
                        fieldValidator: ValidationHelper(
                          isError: (error) => provider.setNameError = error,
                          typeField: TypeField.none,
                        ).validate(),
                      ),
                      CustomDropdown(
                          title: appLoc.gender,
                          value: _gender,
                          onChanged: (value) {
                            _gender = value;
                            provider.setIsSelectedGender =
                                _genderList.indexOf(value);
                          },
                          dropdownList: _genderList),
                      CustomTextField(
                        inputType: TextInputType.number,
                        controller: provider.ageController,
                        title: appLoc.age,
                        fieldValidator: ValidationHelper(
                          isError: (error) => provider.setAgeError = error,
                          typeField: TypeField.number,
                        ).validate(),
                      ),
                      CustomTextField(
                        maxLines: 6,
                        controller: provider.hobbyController,
                        title: appLoc.hobby,
                        fieldValidator: ValidationHelper(
                          isError: (error) => provider.setHobbiyError = error,
                          typeField: TypeField.none,
                        ).validate(),
                      ),
                      largeVerticalSpacing(),
                      CustomButton(
                        text: appLoc.start,
                        onPressed: () {
                          if (provider.formKey.currentState!.validate()) {
                            Navigator.pushNamed(
                                context, CategoryPage.routeName);
                            session.setIsOpenName = false;
                            session.setIsOpenCriteria = false;
                            session.setIsOpenWedding = false;
                            session.setIsOpenChild = false;
                            session.setResultName = '';
                            session.setResultCriteria = '';
                            session.setResultWedding = '';
                            session.setResultChild = '';
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
