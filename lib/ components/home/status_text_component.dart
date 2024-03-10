import 'package:flutter/material.dart';

/// ステータステキスト
class StatusTextComponent extends StatelessWidget {
  /// ステータステキスト
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'hoge 始めよう',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Noto Sans JP',
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
