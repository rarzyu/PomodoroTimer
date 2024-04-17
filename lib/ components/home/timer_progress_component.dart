import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';

/// タイマー部分
///
/// 参考
/// - https://www.youtube.com/watch?v=yvC3Z_MreuI
class TimerProgressComponent extends ConsumerWidget {
  // レイアウト
  static const double baseHeightCoefficient = 0.4;
  static const double baseWidthCoefficient = 0.85;

  /// 最終的な表示
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double topPadding = MediaQuery.of(context).size.height * 0.02;
    double bottomPadding = MediaQuery.of(context).size.height * 0.03;

    var settingModel = ref.watch(settingProvider);

    return Container(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          circleBackground(context),
          circleInnerBackground(context),
          progressBar(context),
          centerCircle(context),
          timerText(settingModel.workTime.toString())
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
        depth: 4,
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }

  /// 円型の背景(内側)
  Widget circleInnerBackground(BuildContext context) {
    double baseHeight =
        MediaQuery.of(context).size.height * baseHeightCoefficient;
    double baseWidth = MediaQuery.of(context).size.width * baseWidthCoefficient;

    return Neumorphic(
      child: Container(
        width: baseWidth,
        height: baseHeight,
      ),
      style: NeumorphicStyle(
        depth: -4,
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }

  /// プログレスバー
  /// TODO: 未実装
  Widget progressBar(BuildContext context) {
    double baseHeight =
        MediaQuery.of(context).size.width * baseHeightCoefficient;
    double baseWidth =
        MediaQuery.of(context).size.height * baseWidthCoefficient;

    return Container(
      width: baseWidth * 0.65,
      height: baseHeight * 0.65,
      child: CustomPaint(),
    );
  }

  /// 中心の円
  Widget centerCircle(BuildContext context) {
    double baseHeight =
        MediaQuery.of(context).size.height * baseHeightCoefficient;
    double baseWidth = MediaQuery.of(context).size.width * baseWidthCoefficient;

    return Neumorphic(
      child: Container(
        width: baseWidth * 0.65,
        height: baseHeight * 0.65,
      ),
      style: NeumorphicStyle(
        depth: 4,
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }

  /// タイマーテキスト
  Widget timerText(String time) {
    return Container(
      child: Text(time,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 60,
          )),
    );
  }
}
