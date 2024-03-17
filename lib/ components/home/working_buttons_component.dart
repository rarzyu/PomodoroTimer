import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/text_icon_button_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/generated/l10n.dart';

/// 作業中のボタン群
class WorkingButtonsComponent extends StatelessWidget {
  //レイアウト
  static const double minButtonWidthCoefficient = 0.35;
  static const double minButtonObjectSize = 22;

  /// ボタン群
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skipButton(context),
              resetButton(context),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: pauseButton(context),
          )
        ],
      ),
    );
  }

  /// スキップボタン
  Widget skipButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextIconButtonComponent(
        text: Text(
          S.of(context).skipButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: minButtonObjectSize,
          ),
        ),
        icon: Icon(
          Icons.skip_next_sharp,
          color: AppColors.baseText,
          size: minButtonObjectSize + 1,
        ),
        // TODO: onPressedの処理を実装する
        onPressed: () => print('スキップボタンが押されました'),
        width: screenWidth * minButtonWidthCoefficient);
  }

  /// リセットボタン
  Widget resetButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextIconButtonComponent(
        text: Text(
          S.of(context).resetButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: minButtonObjectSize,
            color: AppColors.subObjectPink,
          ),
        ),
        icon: Icon(
          Icons.refresh_sharp,
          color: AppColors.subObjectPink,
          size: minButtonObjectSize + 1,
        ),
        // TODO: onPressedの処理を実装する
        onPressed: () => print('リセットボタンが押されました'),
        width: screenWidth * minButtonWidthCoefficient);
  }

  /// 一時停止ボタン
  Widget pauseButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextIconButtonComponent(
        text: Text(
          S.of(context).pauseButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 26,
            color: AppColors.subObjectBlue,
          ),
        ),
        icon: Icon(
          Icons.pause_sharp,
          color: AppColors.subObjectBlue,
          size: 28,
        ),
        // TODO: onPressedの処理を実装する
        onPressed: () => print('一時停止ボタンが押されました'),
        width: screenWidth * 0.6);
  }
}
