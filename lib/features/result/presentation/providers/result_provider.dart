import 'package:flutter/material.dart';
import 'package:forecasting/core/core.dart';
import 'package:forecasting/features/result/domain/usecase/result_usecase.dart';
import 'package:forecasting/features/result/presentation/providers/result_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ResultProvider extends LandingProvider {
  final ResultQuestation resultQuestation;
  ResultProvider({required this.resultQuestation});
  int _selectedCategoryIndex = -1;
  String? _resultGenerate;
  String? _resultNama;
  String? _resultKriteria;
  String? _resultPekerjaan;
  String? _resultTanggal;
  String? _resultAnak;
  String? _loadingText;
  RewardedAd? _rewardedAd;
  RewardedAd? _rewardAd;

  set setSelectedCategoryIndex(val) {
    _selectedCategoryIndex = val;
    notifyListeners();
  }

  set seResultGenerate(val) {
    _resultGenerate = val;
    notifyListeners();
  }

  set setLoadingText(val) {
    _loadingText = val;
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

  int get selectedCategoryIndex => _selectedCategoryIndex;
  String? get resultGenerate => _resultGenerate;
  String? get resultNama => _resultNama;
  String? get resultKriteria => _resultKriteria;
  String? get resultPekerjaan => _resultPekerjaan;
  String? get resultTanggal => _resultTanggal;
  String? get resultAnak => _resultAnak;
  String? get LoadingText => _loadingText;
  RewardedAd? get rewardedAd => _rewardedAd;
  RewardedAd? get rewardAd => _rewardAd;

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
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  final List title = [
    "Nama Jodoh",
    "Kriteria Jodoh",
    "Pekerjaan Jodoh",
    "Tanggal Nikah",
    "Nama Anak",
  ];
  final List subTitle = [
    "Tebak nama jodohmu",
    "Tebak kriteria jodohmu",
    "Tebak pekerjaan jodohmu",
    "Tebak tanggal kamu akan nikah",
    "Tebak nama anakmu nanti",
  ];

  Stream<ResultState> fetchResult(landingData) async* {
    yield ResultLoading();
    _loadingText = 'Saya sedang meramal nama jodoh anda ...';
    final data = {
      "nama": landingData.nameController.text,
      "jenis_kelamin": landingData.gender,
      "umur": landingData.ageController.text,
      "hobi": landingData.hobbyController.text,
    };

    final resNama = await resultQuestation.call(data, 'nama-jodoh');
    final resKriteria = await resultQuestation.call(data, 'kriteria-jodoh');
    final resTanggal = await resultQuestation.call(data, 'tanggal-nikah');
    final resPekerjaan = await resultQuestation.call(data, 'pekerjaan-jodoh');
    final resAnak = await resultQuestation.call(data, 'nama-anak');

    yield* resNama.fold((error) async* {
      setLoadingText = error.toString();
      yield ResultFailure(error: error);
    }, (res) async* {
      _resultGenerate = res.data;
      _resultNama = res.data;
    });
    _loadingText = 'Saya sedang meramal kriteria jodoh anda ...';
    yield* resKriteria.fold((error) async* {
      setLoadingText = error.toString();
      yield ResultFailure(error: error);
    }, (res) async* {
      _resultKriteria = res.data;
    });

    _loadingText = 'Saya sedang meramal tanggal nikah anda ...';
    yield* resTanggal.fold((error) async* {
      setLoadingText = error.toString();
      yield ResultFailure(error: error);
    }, (res) async* {
      _resultTanggal = res.data;
    });

    _loadingText = 'Saya sedang meramal pekerjaan jodoh anda ...';
    yield* resPekerjaan.fold((error) async* {
      setLoadingText = error.toString();
      yield ResultFailure(error: error);
    }, (res) async* {
      _resultPekerjaan = res.data;
    });

    _loadingText = 'Saya sedang meramal nama anak anda ...';
    yield* resAnak.fold((error) async* {
      setLoadingText = error.toString();
      yield ResultFailure(error: error);
    }, (res) async* {
      _resultAnak = res.data;
      yield ResultSuccess();
    });
  }
}
