import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';
import 'package:pomodoro_timer/services/timer_state_service.dart';
import 'package:pomodoro_timer/states/timer_state.dart';
import 'package:pomodoro_timer/utils/format_util.dart';

/// タイマーの状態管理
/// - Timerなどの管理はここで行う
/// - 状態の決定などの処理はServiceで行う
final timerStateProvider =
    StateNotifierProvider<TimerStateNotifier, TimerState>(
  (ref) {
    final settingModel = ref.watch(settingProvider);
    return TimerStateNotifier(settingModel: settingModel);
  },
);

class TimerStateNotifier extends StateNotifier<TimerState> {
  Timer? _timer;
  final Stopwatch _stopwatch = Stopwatch(); // 正確に時間を計測するため、Stopwatchを使用
  final SettingModel _settingModel;
  final FormatUtil _formatUtil = FormatUtil();
  final TimerStateService _timerStateService;

  TimerStateNotifier({
    required SettingModel settingModel,
  })  : _settingModel = settingModel,
        _timerStateService = TimerStateService(settingModel: settingModel),
        super(TimerState(
          status: TimerStatus.stopped,
          type: TimerType.work,
          remainingTime: Duration(minutes: settingModel.workTime),
          remainingSets: settingModel.numberSets,
          remainingUntilLongBreak: settingModel.numberUntilLongBreak,
        ));

  @override
  get state => super.state;

  // タイマーの文字列
  get remainingTimeString => _formatUtil.formatDuration(state.remainingTime);

  // タイマーが終了したかどうか
  get isFinished => _timerStateService.isFinished(state);

  /// タイマーの開始
  void start() {
    // タイマーが停止中の場合のみ実行
    if (state.status == TimerStatus.stopped ||
        state.status == TimerStatus.paused) {
      _stopwatch.reset();
      _stopwatch.start();

      state = state.copyWith(status: TimerStatus.running, type: TimerType.work);

      // 1秒毎にコールバック
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          _countDown(timer);
        },
      );
    }
  }

  /// タイマーの一時停止
  void pause() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      state = state.copyWith(status: TimerStatus.paused);
      _stopwatch.stop();
      _timer?.cancel();
    }
  }

  /// タイマーのリセット
  void reset() {
    // タイマーが実行中または一時停止中の場合のみ実行
    if (state.status == TimerStatus.running ||
        state.status == TimerStatus.paused) {
      state = state.copyWith(
        status: TimerStatus.stopped,
        type: TimerType.work,
        remainingTime: Duration(minutes: _settingModel.workTime),
        remainingSets: _settingModel.numberSets,
        remainingUntilLongBreak: _settingModel.numberUntilLongBreak,
      );
      _stopwatch.reset();
      _timer?.cancel();
    }
  }

  /// タイマーのスキップ
  void skip() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      if (_timerStateService.isFinished(state)) {
        // 終了の場合はタイマーを停止
        reset();
      } else {
        state = _timerStateService.setNextTimer(state);
      }
    }
  }

  /// タイマーの再開
  void restart() {
    // タイマーが一時停止中の場合のみ実行
    if (state.status == TimerStatus.paused) {
      _stopwatch.start();
      state = state.copyWith(status: TimerStatus.running);

      // 1秒毎にコールバック
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          _countDown(timer);
        },
      );
    }
  }

  /// カウントダウン
  void _countDown(Timer timer) {
    final Duration newRemainingTime =
        state.remainingTime - Duration(seconds: 1);

    if (state.remainingTime.inSeconds > 0) {
      // 残り時間が0秒より大きい場合
      state = state.copyWith(remainingTime: newRemainingTime);

      if (state.remainingTime.inSeconds <= 3 && _settingModel.isAlert) {
        // カウントダウンサウンドを鳴らす
        _timerStateService.playCountdownSound(state);
      }
    } else {
      // 残り時間が0秒の場合
      timer.cancel();
      _stopwatch.reset();
      if (!_timerStateService.isFinished(state)) {
        // バイブレーションを実行
        _timerStateService.vibrate();

        // 終了でなければ、次のタイマーをセット
        state = _timerStateService.setNextTimer(state);
        _stopwatch.start();

        _timer = Timer.periodic(
          const Duration(seconds: 1),
          (Timer timer) {
            _countDown(timer);
          },
        );
      } else {
        // 完了アラートを鳴らす
        _timerStateService.playCompleteSound();

        // 終了の場合はリセット
        reset();
      }
    }
  }
}
