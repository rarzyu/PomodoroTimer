import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';
import 'package:pomodoro_timer/states/timer_state.dart';

/// ステータステキスト
class StatusTextComponent extends ConsumerWidget {
  /// ステータステキスト
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerStateProvider);

    double screenHeight = MediaQuery.of(context).size.height;
    double fontsize =
        (AppDimens.baseTitleTextSize / AppDimens.baseScreenHeight) *
            screenHeight;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: _getTitle(state, fontsize),
    );
  }

  /// タイトルテキスト
  Text _getTitle(TimerState state, double fontSize) {
    String title = '';
    Color color = AppColors.baseText;

    switch (state.type) {
      case TimerType.work:
        title = S.current.workingTitle;
      case TimerType.rest:
        title = S.current.breakTitle;
        color = AppColors.subObjectPink;
      case TimerType.longRest:
        title = S.current.longBreakTitle;
        color = AppColors.subObjectGreen;
    }

    // タイマーが停止中の場合は最初のタイトル
    if (state.status == TimerStatus.stopped) {
      title = S.current.startTitle;
    }

    return Text(
      title,
      style: AppDimens.baseTextStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
