import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// show_dialogのコンポーネント
class ShowDialogComponent {
  /// ダイアログを表示する
  /// - OKボタンのみのダイアログ
  void showInfoDialog(BuildContext context, String title, String message) {
    // ダイアログを表示する
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(
            message,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                // ダイアログを閉じる
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
