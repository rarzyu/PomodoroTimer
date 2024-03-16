import 'package:flutter/material.dart';

/// 画面遷移の共通処理
class NavigateUtil {

  /// 画面遷移が可能かどうかの判定
  /// 
  /// @param context BuildContext
  /// @param routeName 遷移先のパス
  /// @return true:画面遷移が可能/false:画面遷移が不可能
  static bool canNavigateToPage(BuildContext context, String routeName) {
    // 遷移先が現在の画面かどうかの判定
    bool isCurrentRoute = false;

    Navigator.popUntil(context, (route) {
      if (route.settings.name == routeName) {
        isCurrentRoute = true;
      }
      // popUntil関数を停止せずに全てのルートを確認するために常にtrueを返す
      return true;
    });

    // 現在の画面の場合は遷移しない
    return !isCurrentRoute;
  }
}
