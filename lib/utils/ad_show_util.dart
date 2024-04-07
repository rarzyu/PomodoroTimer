import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/services/ad_service.dart';

/// 広告（Admob）の表示用
class AdShowUtil {
  AdService adModel = AdService();

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
