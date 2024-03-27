import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/domains/ad_domain.dart';

/// 広告（Admob）のコントローラー
class AdController {
  AdModel adModel = AdModel();

  BannerAd get bannerAd => adModel.bannerAd;

  // インタースティシャル広告を表示
  void showInterstitialAd() {
    adModel.showInterstitialAd();
  }

  // ランダムでインタースティシャル広告を表示
  void showInterstitialAdRandom() {
    adModel.showInterstitialAdRandom();
  }
}
