import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/text_icon_button_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// スタートボタン
class StartButtonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextIconButtonComponent(
      text: Text('スタート',
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 26,
          )),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.baseText,
        size: 30,
      ),
      onPressed: () => print('スタートボタンが押されました'),
      width: (screenWidth * 0.6).toInt(),
    );
  }
}
