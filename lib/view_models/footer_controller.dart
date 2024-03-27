import 'package:flutter/material.dart';
import 'package:pomodoro_timer/view_models/ad_controller.dart';
import '../utils/navigate_util.dart';

/// フッター用Controller
class FooterController {
  AdController adController = AdController();

  /// 画面遷移
  ///
  /// @param context BuildContext
  /// @param path 遷移先のパス
  void navigateTo(BuildContext context, String path) {
    // 画面遷移が可能な場合に遷移
    if (NavigateUtil.canNavigateToPage(context, path)) {
      // 確率でインタースティシャル広告を表示
      adController.showInterstitialAdRandom();

      // 遷移
      Navigator.pushNamed(context, path);
    }
  }
}
