import 'package:flutter/material.dart';

/// 作業中のボタン群
class WorkingButtonsComponent extends StatelessWidget {
  /// ボタン群
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => print('一時停止ボタンが押されました'),
            child: Text('一時停止'),
          ),
          TextButton(
            onPressed: () => print('終了ボタンが押されました'),
            child: Text('終了'),
          ),
        ],
      ),
    );
  }

  /// スキップボタン
  /// リセットボタン
  /// 一時停止ボタン
}
