
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

/// タイマーの状態管理オブジェクト
@freezed
class TimerState with _$TimerState {

  const factory TimerState({
    required TimerStatus status,
    required TimerType type,
    required Duration remainingTime,
    required int remainingSets,  // 残りセット数：SettingModel.numberSetsから減算する
    required int remainingUntilLongBreak,  // 長期休憩までの残りセット数：SettingModel.numberUntilLongBreakから減算されていく
  }) = _TimerState;
}