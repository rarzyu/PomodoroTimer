import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/controllers/ad_controller.dart';
import '../utils/navigate_util.dart';

/// フッター用Controller
class FooterController {
  AdController adController = AdController();

  /// 画面遷移
  ///
  /// @param context BuildContext
  /// @param path 遷移先のパス
  void navigateTo(BuildContext context, String path) {
    // 確率でインタースティシャル広告を表示
    adController.showInterstitialAdRandom();

    NavigateUtil.navigateToPage(context, path);
  }
}
