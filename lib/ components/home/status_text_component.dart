import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// ステータステキスト
class StatusTextComponent extends StatelessWidget {
  /// ステータステキスト
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hoge 始めよう',
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 40,
          )),
    );
  }
}
