import 'package:flutter/material.dart';
import 'package:pomodoro_timer/utils/ad_show_util.dart';
import '../utils/navigate_util.dart';

/// フッター用ViewModel
class FooterViewModel {
  AdShowUtil adShowUtil = AdShowUtil();

  /// 画面遷移
  ///
  /// @param context BuildContext
  /// @param path 遷移先のパス
  void navigateTo(BuildContext context, String path) {
    // 画面遷移が可能な場合に遷移
    if (NavigateUtil.canNavigateToPage(context, path)) {
      // 確率でインタースティシャル広告を表示
      adShowUtil.showInterstitialAdRandom();

      // 遷移
      Navigator.pushNamed(context, path);
    }
  }
}
