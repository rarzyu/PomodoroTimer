import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/common/text_icon_button_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';

/// 作業中のボタン群
class WorkingButtonsComponent extends ConsumerWidget {
  /// ボタン群
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerStateProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double smallButtonWidh =
        (AppDimens.baseSmallButtonWidth / AppDimens.baseScreenWidth) *
            screenWidth;
    double smallButtonFontSize =
        (AppDimens.baseSmallButtonTextSize / AppDimens.baseScreenWidth) *
            screenWidth;

    double largeButtonWidth =
        (AppDimens.baseLargeButtonWidth / AppDimens.baseScreenWidth) *
            screenWidth;
    double largeButtonFontSize =
        (AppDimens.baseLargeButtonTextSize / AppDimens.baseScreenWidth) *
            screenWidth;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skipButton(context, ref, smallButtonWidh, smallButtonFontSize),
              resetButton(context, ref, smallButtonWidh, smallButtonFontSize),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: state.status == TimerStatus.paused
                ? restartButton(
                    context, ref, largeButtonWidth, largeButtonFontSize)
                : pauseButton(
                    context, ref, largeButtonWidth, largeButtonFontSize),
          )
        ],
      ),
    );
  }

  /// スキップボタン
  Widget skipButton(BuildContext context, WidgetRef ref, double buttonWidth,
      double fontSize) {
    return TextIconButtonComponent(
        text: Text(
          S.of(context).skipButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: fontSize,
          ),
        ),
        icon: Icon(
          Icons.skip_next_sharp,
          color: AppColors.baseText,
          size: fontSize,
        ),
        onPressed: () {
          debugPrint('スキップボタンが押されました');
          ref.read(timerStateProvider.notifier).skip();
        },
        width: buttonWidth);
  }

  /// リセットボタン
  Widget resetButton(BuildContext context, WidgetRef ref, double buttonWidth,
      double fontSize) {
    return TextIconButtonComponent(
        text: Text(
          S.of(context).resetButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: fontSize,
            color: AppColors.subObjectPink,
          ),
        ),
        icon: Icon(
          Icons.refresh_sharp,
          color: AppColors.subObjectPink,
          size: fontSize,
        ),
        onPressed: () {
          debugPrint('リセットボタンが押されました');
          ref.read(timerStateProvider.notifier).reset();
        },
        width: buttonWidth);
  }

  /// 一時停止ボタン
  Widget pauseButton(BuildContext context, WidgetRef ref, double buttonWidth,
      double fontSize) {
    return TextIconButtonComponent(
        text: Text(
          S.of(context).pauseButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: fontSize,
            color: AppColors.subObjectBlue,
          ),
        ),
        icon: Icon(
          Icons.pause_sharp,
          color: AppColors.subObjectBlue,
          size: fontSize,
        ),
        onPressed: () {
          debugPrint('一時停止ボタンが押されました');
          ref.read(timerStateProvider.notifier).pause();
        },
        width: buttonWidth);
  }

  /// 再開ボタン
  Widget restartButton(BuildContext context, WidgetRef ref, double buttonWidth,
      double fontSize) {
    return TextIconButtonComponent(
        text: Text(
          S.of(context).restartButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: fontSize,
            color: AppColors.baseText,
          ),
        ),
        icon: Icon(
          Icons.play_arrow_rounded,
          color: AppColors.baseText,
          size: fontSize,
        ),
        onPressed: () {
          debugPrint('再開ボタンが押されました');
          ref.read(timerStateProvider.notifier).restart();
        },
        width: buttonWidth);
  }
}
