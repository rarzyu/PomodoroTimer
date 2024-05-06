import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/view_models/show_dialog_component_view_model.dart';

/// show_dialogのコンポーネント
class ShowDialogComponent {
  final ShowDialogComponentViewModel _viewModel =
      ShowDialogComponentViewModel();

  /// ダイアログを表示し、インタースティシャル広告を表示する
  /// - OKボタンのみのダイアログ
  void showInfoDialogAfterAd(
      BuildContext context, String title, String message) {
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
                // インタースティシャル広告を表示する
                _viewModel.showInterstitialAd();
              },
            ),
          ],
        );
      },
    );
  }
}
