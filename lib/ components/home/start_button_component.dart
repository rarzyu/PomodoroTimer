import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/common/text_icon_button_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/generated/l10n.dart';

/// スタートボタン
class StartButtonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topPadding = screenHeight * 0.02;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: TextIconButtonComponent(
        text: Text(S.of(context).startButton,
            style: AppDimens.baseTextStyle.copyWith(
              fontSize: 25,
            )),
        icon: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.baseText,
          size: 25,
        ),
        // TODO: onPressedの処理を実装する
        onPressed: () => print('スタートボタンが押されました'),
        width: screenWidth * 0.6,
      ),
    );
  }
}
