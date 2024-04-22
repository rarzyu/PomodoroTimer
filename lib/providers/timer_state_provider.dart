import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';
import 'package:pomodoro_timer/states/timer_state.dart';

/// タイマーの状態管理
final timerStateProvider =
    StateNotifierProvider<TimerStateNotifier, TimerState>(
  (ref) {
    final settingModel = ref.watch(settingProvider);
    return TimerStateNotifier(settingModel: settingModel);
  },
);

class TimerStateNotifier extends StateNotifier<TimerState> {
  Timer? timer;
  SettingModel settingModel;

  TimerStateNotifier({
    required this.settingModel,
  }) : super(TimerState(
          status: TimerStatus.stopped,
          type: TimerType.work,
          remainingTime: Duration(minutes: settingModel.workTime),
          remainingSets: settingModel.numberSets,
          remainingUntilLongBreak: settingModel.numberUntilLongBreak,
        ));

  @override
  get state => super.state;

  /// タイマーの開始
  void start() {
    // タイマーが停止中の場合のみ実行
    if (state.status == TimerStatus.stopped ||
        state.status == TimerStatus.paused) {
      state = state.copyWith(status: TimerStatus.running);
      timer = Timer.periodic(
        const Duration(seconds: 1), // 1秒ごとに実行
        (timer) {
          // 残り時間が0秒より大きい場合
          if (state.remainingTime.inSeconds > 0) {
            state = state.copyWith(
                remainingTime:
                    state.remainingTime - const Duration(seconds: 1));
          } else {
            timer.cancel();

            // 終了でなければ、次のタイマーをセット
            if (!isFinished()) {
              _setNextTimer();
            }
          }
        },
      );
    }
  }

  /// タイマーの一時停止
  void pause() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      state = state.copyWith(status: TimerStatus.paused);
      timer?.cancel();
    }
  }

  /// タイマーの停止
  void stop() {
    // タイマーが実行中または一時停止中の場合のみ実行
    if (state.status == TimerStatus.running ||
        state.status == TimerStatus.paused) {
      state = state.copyWith(
        status: TimerStatus.stopped,
        type: TimerType.work,
        remainingTime: Duration(minutes: settingModel.workTime),
      );
      timer?.cancel();
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

  /// 次のタイマーをセットする
  void _setNextTimer() {
    // タイマーが実行中の場合のみ実行
    if (state.status == TimerStatus.running) {
      state = state.copyWith(
        type: _getNextTimerType(),
        remainingTime: _getNextTime(),
      );

      // 作業が完了した後（休憩の前）にセット数をデクリメント
      if (state.type == TimerType.work) {
        decrementSets();
      }
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
        _nextTime = Duration(minutes: settingModel.workTime);
        break;
      case TimerType.rest:
        _nextTime = Duration(minutes: settingModel.breakTime);
        break;
      case TimerType.longRest:
        _nextTime = Duration(minutes: settingModel.longBreakTime);
        break;
    }

    return _nextTime;
  }

  /// 終了判定を行う関数
  /// true: 終了、false: 継続
  bool isFinished() {
    // 次が長期休憩＆残りセット数が1の場合は終了
    return _getNextTimerType() == TimerType.longRest &&
        state.remainingSets == 1;
  }

  /// セット数のカウントダウン
  /// - 残りセット数、長期休憩までの残りセット数をデクリメント
  /// - 作業が完了した後（休憩の前）に実行
  void decrementSets() {
    if (state.remainingUntilLongBreak == 1) {
      // 長期休憩までの残りセット数が1の場合は長期休憩までの残りセット数をリセットし、セット数をデクリメント
      state = state.copyWith(
        remainingSets: settingModel.numberSets - 1,
        remainingUntilLongBreak: settingModel.numberUntilLongBreak,
      );
    } else {
      state = state.copyWith(
        remainingSets: state.remainingSets - 1,
      );
    }
  }
}
