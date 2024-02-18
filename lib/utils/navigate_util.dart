import 'package:flutter/material.dart';

/// 画面遷移の共通処理
class NavigateUtil {

  /// 画面遷移が可能な場合に遷移する
  static void navigateToPage(BuildContext context, String routeName) {
    bool isCurrentRoute = false;

    Navigator.popUntil(context, (route) {
      if (route.settings.name == routeName) {
        isCurrentRoute = true;
      }
      // popUntil関数を停止せずに全てのルートを確認するために常にtrueを返す
      return true;
    });

    // 現在のルートでない場合は遷移する
    if (!isCurrentRoute) {
      Navigator.pushNamed(context, routeName);
    }
  }
}
