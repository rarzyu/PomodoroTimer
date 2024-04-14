import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/statuses/timer_status.dart';

/// タイマーの状態管理
final timerProvider = StateNotifierProvider<TimerStatusProvider, TimerStatus>((ref) {
  return TimerStatusProvider();
});

class TimerStatusProvider extends StateNotifier<TimerStatus> {
  Timer? _timer;
  
}