import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/home/progress_circle_component.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';
import 'package:pomodoro_timer/states/timer_state.dart';

/// タイマー部分
///
/// 参考
/// - https://www.youtube.com/watch?v=yvC3Z_MreuI
class TimerProgressComponent extends ConsumerWidget {
  // レイアウト
  static const double baseHeightCoefficient = 0.4;
  static const double baseWidthCoefficient = 0.85;
  static const double centerCircleCoefficient = 0.65;

  /// 最終的な表示
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerStateProvider);
    final settingModel = ref.watch(settingProvider);
    double topPadding = MediaQuery.of(context).size.height * 0.02;
    double bottomPadding = MediaQuery.of(context).size.height * 0.03;

    return Container(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          circleBackground(context),
          state.status == TimerStatus.stopped // タイマーが止まっている場合は表示しない
              ? Container()
              : progressBar(context, state, settingModel),
          centerCircle(context),
          timerText(ref.watch(timerStateProvider.notifier).remainingTimeString,
              state),
        ],
      ),
    );
  }

  /// 円型の背景
  Widget circleBackground(BuildContext context) {
    double baseHeight =
        MediaQuery.of(context).size.height * baseHeightCoefficient;
    double baseWidth = MediaQuery.of(context).size.width * baseWidthCoefficient;

    return Neumorphic(
      child: Container(
        width: baseWidth,
        height: baseHeight,
      ),
      style: NeumorphicStyle(
        depth: -5,
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }

  /// プログレスバー
  Widget progressBar(
      BuildContext context, TimerState state, SettingModel settingModel) {
    double baseHeight =
        MediaQuery.of(context).size.height * baseHeightCoefficient;
    double baseWidth = MediaQuery.of(context).size.width * baseWidthCoefficient;

    // プログレスバーの幅：背景の半径
    double width = baseWidth / 2;

    return Neumorphic(
        style: NeumorphicStyle(
          depth: -5,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: CustomPaint(
          painter: ProgressCircleComponent(
              state: state, width: width, settingModel: settingModel),
          child: Container(
            width: baseWidth,
            height: baseHeight,
          ),
        ));
  }

  /// 中心の円
  Widget centerCircle(BuildContext context) {
    double baseHeight =
        MediaQuery.of(context).size.height * baseHeightCoefficient;
    double baseWidth = MediaQuery.of(context).size.width * baseWidthCoefficient;

    return Neumorphic(
      child: Container(
        width: baseWidth * centerCircleCoefficient,
        height: baseHeight * centerCircleCoefficient,
      ),
      style: NeumorphicStyle(
        depth: 2,
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }

  /// タイマーテキスト
  Widget timerText(String time, TimerState state) {
    return Container(
      child: Text(time,
          style: AppDimens.baseTextStyle
              .copyWith(fontSize: 60, color: _getTimeColor(state))),
    );
  }

  /// タイマーの文字色
  Color _getTimeColor(TimerState state) {
    Color color = AppColors.baseText;

    switch (state.type) {
      case TimerType.rest:
        color = AppColors.subObjectPink;
      case TimerType.longRest:
        color = AppColors.subObjectGreen;
      default:
        color = AppColors.baseText;
    }
    return color;
  }
}
