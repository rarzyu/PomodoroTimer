import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/services/ad_service.dart';
import '../utils/navigate_util.dart';

/// フッター用ViewModel
class FooterViewModel {
  final AdService _adService = AdService();

  late BannerAd bannerAd;
  InterstitialAd? interstitialAd;

  /// コンストラクタ
  FooterViewModel() {
    bannerAd = _adService.bannerAd;
    interstitialAd = _adService.interstitialAd;
  }

  /// 画面遷移
  ///
  /// @param context BuildContext
  /// @param path 遷移先のパス
  void navigateTo(BuildContext context, String path) {
    // 画面遷移が可能な場合に遷移
    if (NavigateUtil.canNavigateToPage(context, path)) {
      // 確率でインタースティシャル広告を表示
      _adService.showInterstitialAdRandom();

      _adService.bannerAd.dispose(); // 広告の破棄
      _adService.createBannerAd(); // 広告の再生成

      // 遷移
      Navigator.pushNamed(context, path);
    }
  }
}
