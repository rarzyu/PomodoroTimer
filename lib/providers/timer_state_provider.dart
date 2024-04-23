import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';
import 'package:pomodoro_timer/states/timer_state.dart';
import 'package:pomodoro_timer/utils/format_util.dart';

/// タイマーの状態管理
final timerStateProvider =
    StateNotifierProvider<TimerStateNotifier, TimerState>(
  (ref) {
    final settingModel = ref.watch(settingProvider);
    return TimerStateNotifier(settingModel: settingModel);
  },
);

class TimerStateNotifier extends StateNotifier<TimerState> {
  Timer? _timer;
  Stopwatch _stopwatch = Stopwatch(); // 正確に時間を計測するため、Stopwatchを使用
  SettingModel _settingModel;

  TimerStateNotifier({
    required SettingModel settingModel,
  })  : _settingModel = settingModel,
        super(TimerState(
          status: TimerStatus.stopped,
          type: TimerType.work,
          remainingTime: Duration(minutes: settingModel.workTime),
          remainingSets: settingModel.numberSets,
          remainingUntilLongBreak: settingModel.numberUntilLongBreak,
        ));

  @override
  get state => super.state;

  get remainingTimeString => FormatUtil().formatDuration(state.remainingTime);

  /// タイマーの開始
  void start() {
    // タイマーが停止中の場合のみ実行
    if (state.status == TimerStatus.stopped ||
        state.status == TimerStatus.paused) {
      _stopwatch.reset();
      _stopwatch.start();

      state = state.copyWith(status: TimerStatus.running);

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
      );
      _stopwatch.reset();
      _timer?.cancel();
    }
  }

  /// タイマーのスキップ
  void skip() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      state = state.copyWith(
        type: _getNextTimerType(),
        remainingTime: _getNextTime(),
      );
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

  /// 終了判定を行う関数
  /// true: 終了、false: 継続
  bool isFinished() {
    // 次が長期休憩＆残りセット数が1の場合は終了
    return _getNextTimerType() == TimerType.longRest &&
        state.remainingSets == 1;
  }

  /// 次のタイマーをセットする
  void _setNextTimer() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      // 作業が完了した後（休憩の前）にセット数をデクリメント
      if (state.type == TimerType.work) {
        _decrementSets();
      }

      state = state.copyWith(
        type: _getNextTimerType(),
        remainingTime: _getNextTime(),
      );
    }
  }

  /// 次のタイマーの種類を取得する関数
  TimerType _getNextTimerType() {
    TimerType _nextType;

    if (state.type == TimerType.work) {
      // 長期休憩までのカウントが1の場合は長期休憩、それ以外は休憩
      _nextType = state.remainingUntilLongBreak == 1
          ? TimerType.longRest
          : TimerType.rest;
    } else {
      // 種類が作業以外の場合は休憩なので、次は必ず作業になる
      _nextType = TimerType.work;
    }

    return _nextType;
  }

  /// 次のタイマーの時間を取得する関数
  Duration _getNextTime() {
    Duration _nextTime;

    switch (_getNextTimerType()) {
      case TimerType.work:
        _nextTime = Duration(minutes: _settingModel.workTime);
        break;
      case TimerType.rest:
        _nextTime = Duration(minutes: _settingModel.breakTime);
        break;
      case TimerType.longRest:
        _nextTime = Duration(minutes: _settingModel.longBreakTime);
        break;
    }

    return _nextTime;
  }

  /// セット数のカウントダウン
  /// - 残りセット数、長期休憩までの残りセット数をデクリメント
  /// - 作業が完了した後（休憩の前）に実行
  void _decrementSets() {
    if (state.remainingUntilLongBreak == 1) {
      // 長期休憩までの残りセット数が1の場合は長期休憩までの残りセット数をリセットし、セット数をデクリメント
      state = state.copyWith(
        remainingSets: _settingModel.numberSets - 1,
        remainingUntilLongBreak: _settingModel.numberUntilLongBreak,
      );
    } else {
      state = state.copyWith(
        remainingSets: state.remainingSets - 1,
      );
    }
  }

  /// カウントダウン
  void _countDown(Timer timer) {
    final int elapsedSeconds = _stopwatch.elapsed.inSeconds;
    final Duration newRemainingTime =
        Duration(minutes: _settingModel.workTime) -
            Duration(seconds: elapsedSeconds);

    // 残り時間が0秒より大きい場合
    if (state.remainingTime.inSeconds > 0) {
      state = state.copyWith(remainingTime: newRemainingTime);
    } else {
      if (!isFinished()) {
        // 終了でなければ、次のタイマーをセット
        _stopwatch.reset();
        _setNextTimer();
      } else {
        // 終了の場合はタイマーを停止
        _stopwatch.stop();
        timer.cancel();
      }
    }
  }
}
