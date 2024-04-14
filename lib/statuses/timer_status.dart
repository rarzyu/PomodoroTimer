
import 'package:pomodoro_timer/constants/timer_state.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';

/// タイマーステータスオブジェクト
class TimerStatus {
  /// タイマーの状態
  final TimerState state;

  /// タイマーの種類
  final TimerType type;

  /// タイマーの残り時間
  final Duration remainingTime;

  /// タイマーステータスオブジェクトのコンストラクタ
  TimerStatus({
    required this.state,
    required this.type,
    required this.remainingTime,
  });
}