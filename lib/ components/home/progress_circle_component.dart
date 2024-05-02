import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/states/timer_state.dart';

/// 円形のプログレスバーを表示するコンポーネント
class ProgressCircleComponent extends CustomPainter {
  final TimerState state;
  final double width;
  final SettingModel settingModel;

  /// コンストラクタ
  ProgressCircleComponent({
    required this.state,
    required this.width,
    required this.settingModel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.mainColor
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    final backgroundPaint = Paint()
      ..color = _getProgressColor()
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    // 背景
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      width / 2,
      backgroundPaint,
    );

    // 進捗度合い
    double angle =
        2 * math.pi * (state.remainingTime.inSeconds / _getDenominator());
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: width / 2),
      -math.pi / 2, // 12時の位置からスタート
      -angle, // 時計回りに進むためマイナス
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  /// 色
  Color _getProgressColor() {
    switch (state.type) {
      case TimerType.work:
        return AppColors.subObjectBlue;
      case TimerType.rest:
        return AppColors.subObjectPink;
      case TimerType.longRest:
        return AppColors.subObjectGreen;
    }
  }

  /// 分母の算出
  double _getDenominator() {
    switch (state.type) {
      case TimerType.work:
        return settingModel.workTime * 60;
      case TimerType.rest:
        return settingModel.breakTime * 60;
      case TimerType.longRest:
        return settingModel.longBreakTime * 60;
    }
  }
}
