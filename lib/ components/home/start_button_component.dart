import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/common/text_icon_button_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';

/// スタートボタン
class StartButtonComponent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topPadding = screenHeight * 0.015;

    double fontsize =
        (AppDimens.baseLargeButtonTextSize / AppDimens.baseScreenHeight) *
            screenHeight;

    double buttonWidth =
        (AppDimens.baseLargeButtonWidth / AppDimens.baseScreenWidth) *
            screenWidth;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: TextIconButtonComponent(
        text: Text(S.of(context).startButton,
            style: AppDimens.baseTextStyle.copyWith(
              fontSize: fontsize,
            )),
        icon: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.baseText,
          size: fontsize,
        ),
        onPressed: () {
          debugPrint('スタートボタンが押されました');
          ref.read(timerStateProvider.notifier).start();
        },
        width: buttonWidth,
      ),
    );
  }
}
