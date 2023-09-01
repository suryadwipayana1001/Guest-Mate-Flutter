import 'package:flutter/material.dart';
import 'package:forecasting/core/presentation/providers/result_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../features/result/domain/usecase/result_usecase.dart';
import '../../core.dart';
import '../../domain/entities/dropdown_option_entities.dart';

class CoreProvider with ChangeNotifier {
  final ResultQuestation resultQuestation;
  CoreProvider({required this.resultQuestation});
  //Language
  DropdownOption? _language =
      DropdownOption(title: "English", value: "en", index: 0);
  final List<DropdownOption> languageList = [
    DropdownOption(
      title: "English",
      value: "en",
      index: 0,
    ),
    DropdownOption(title: "Indonesia", value: "id", index: 1),
    DropdownOption(title: "Arabic", value: "ar", index: 2),
    DropdownOption(title: "Chinese", value: "zh", index: 3),
    DropdownOption(title: "Danish", value: "da", index: 4),
    DropdownOption(title: "Dutch", value: "nl", index: 5),
    DropdownOption(title: "Finnish", value: "fi", index: 6),
    DropdownOption(title: "French", value: "fr", index: 7),
    DropdownOption(title: "German", value: "de", index: 8),
    DropdownOption(title: "Greek", value: "el", index: 9),
    DropdownOption(title: "Italian", value: "it", index: 10),
    DropdownOption(title: "Japanese", value: "ja", index: 11),
    DropdownOption(title: "Korean", value: "ko", index: 12),
    DropdownOption(title: "Norwegian", value: "no", index: 13),
    DropdownOption(title: "Polish", value: "pl", index: 14),
    DropdownOption(title: "Portuguese", value: "pt", index: 15),
    DropdownOption(title: "Russian", value: "ru", index: 16),
    DropdownOption(title: "Spanish", value: "es", index: 17),
    DropdownOption(title: "Swedish", value: "sv", index: 18),
    DropdownOption(title: "Turkish", value: "tr", index: 19)
  ];

  String? _result;
  RewardedAd? _rewardedAd;
  RewardedAd? _rewardAd;
  set setLanguage(val) {
    _language = val;
    notifyListeners();
  }

  set setRewardedAd(val) {
    _rewardedAd = val;
    notifyListeners();
  }

  set setRewardAd(val) {
    _rewardAd = val;
    notifyListeners();
  }

  void initializeRewardAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setRewardAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedAd ad) {
              ad.dispose();
              setRewardedAd = null;
              initializeRewardAd();
            },
            onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
              ad.dispose();
              initializeRewardAd();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          printWarning('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  RewardedAd? get rewardedAd => _rewardedAd;
  RewardedAd? get rewardAd => _rewardAd;

  DropdownOption? get language => _language;
  String? get result => _result;
  //Form
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _hobbyContoller = TextEditingController();
  int _isSelectedGender = 0;
  String _gender = "male";

  set setGender(val) {
    _gender = val;
    notifyListeners();
  }

  set setIsSelectedGender(val) {
    _isSelectedGender = val;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get gender => _gender;
  int get isSelectedGender => _isSelectedGender;
  TextEditingController get ageController => _ageController;
  TextEditingController get nameController => _nameController;
  TextEditingController get hobbyController => _hobbyContoller;

  //Handle Error
  bool _nameError = false;
  bool _ageError = false;
  bool _hobbyError = false;

  set setAgeError(val) {
    _ageError = val;
    notifyListeners();
  }

  set setNameError(val) {
    _nameError = val;
    notifyListeners();
  }

  set setHobbiyError(val) {
    _hobbyError = val;
    notifyListeners();
  }

  set setResult(val) {
    _result = val;
    notifyListeners();
  }

  bool get hobbyError => _hobbyError;
  bool get nameError => _nameError;
  bool get ageError => _ageError;

  Stream<ResultState> fetch(String type) async* {
    final session = locator<Session>();

    yield ResultLoading();
    final data = {
      "nama": nameController.text,
      "jenis_kelamin": gender,
      "umur": ageController.text,
      "hobi": hobbyController.text,
      "lang": session.isLang != '' ? session.isLang : language!.value,
    };
    printWarning(nameController.text);
    printWarning(gender);
    printWarning(ageController.text);
    printWarning(hobbyController.text);
    printWarning(
      session.isLang != '' ? session.isLang : language!.value,
    );
    final res = await resultQuestation.call(data, type);
    yield* res.fold((error) async* {
      yield ResultFailure(error: error);
    }, (res) async* {
      _result = res.data;
      yield ResultSuccess();
    });
  }
}
