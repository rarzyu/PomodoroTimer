
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
  //レイアウト
  static const double minButtonWidthCoefficient = 0.35;
  static const double minButtonObjectSize = 22;

  /// ボタン群
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerStateProvider);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skipButton(context, ref),
              resetButton(context, ref),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: state.status == TimerStatus.paused
                ? restartButton(context, ref)
                : pauseButton(context, ref),
          )
        ],
      ),
    );
  }

  /// スキップボタン
  Widget skipButton(BuildContext context, WidgetRef ref) {
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
        onPressed: () {
          debugPrint('スキップボタンが押されました');
          ref.read(timerStateProvider.notifier).skip();
        },
        width: screenWidth * minButtonWidthCoefficient);
  }

  /// リセットボタン
  Widget resetButton(BuildContext context, WidgetRef ref) {
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
        onPressed: () {
          debugPrint('リセットボタンが押されました');
          ref.read(timerStateProvider.notifier).reset();
        },
        width: screenWidth * minButtonWidthCoefficient);
  }

  /// 一時停止ボタン
  Widget pauseButton(BuildContext context, WidgetRef ref) {
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
        onPressed: () {
          debugPrint('一時停止ボタンが押されました');
          ref.read(timerStateProvider.notifier).pause();
        },
        width: screenWidth * 0.6);
  }

  /// 再開ボタン
  Widget restartButton(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextIconButtonComponent(
        text: Text(
          S.of(context).restartButton,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 26,
            color: AppColors.baseText,
          ),
        ),
        icon: Icon(
          Icons.play_arrow_rounded,
          color: AppColors.baseText,
          size: 28,
        ),
        onPressed: () {
          debugPrint('再開ボタンが押されました');
          ref.read(timerStateProvider.notifier).restart();
        },
        width: screenWidth * 0.6);
  }
}
