import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/generated/l10n.dart';

/// ステータステキスト
class StatusTextComponent extends StatelessWidget {
  /// ステータステキスト
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Text(S.of(context).startTitle,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 40,
          )),
    );
  }
}
