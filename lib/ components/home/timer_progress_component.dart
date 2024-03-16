
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// タイマー部分
///
/// 参考
/// - https://www.youtube.com/watch?v=yvC3Z_MreuI
class TimerProgressComponent extends StatelessWidget {
  // レイアウト
  double screenWidth = 0; // 画面の幅
  double screenHeight = 0; // 画面の高さ
  double baseHeight = 0; // 土台の高さ
  double baseWidth = 0; // 土台の幅

  /// 最終的な表示
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    baseHeight = screenHeight * 0.5;
    baseWidth = screenWidth * 0.85;

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          circleBackground(),
          circleInnerBackground(),
          progressBar(),
          centerCircle(),
          timerText(),
        ],
      ),
    );
  }

  /// 円型の背景
  Widget circleBackground() {
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
  Widget circleInnerBackground() {
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
  Widget progressBar() {
    return Container(
      width: baseWidth * 0.65,
      height: baseHeight * 0.65,
      child: CustomPaint(),
    );
  }

  /// 中心の円
  Widget centerCircle() {
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
  Widget timerText() {
    return Container(
      child: Text('25:00',
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: 60,
          )),
    );
  }
}
