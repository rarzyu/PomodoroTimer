
import 'package:pomodoro_timer/services/ad_service.dart';

/// ダイアログComponentのViewModel
class ShowDialogComponentViewModel {
  final AdService _adService = AdService();

  /// インタースティシャル広告を表示する
  void showInterstitialAd() {
    _adService.showInterstitialAd();
  }
  
}