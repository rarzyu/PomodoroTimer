import 'package:audioplayers/audioplayers.dart';
import 'package:pomodoro_timer/constants/timer_type.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/states/timer_state.dart';
import 'package:vibration/vibration.dart';

/// タイマーの状態管理用Service
/// - 時間はProviderで管理するのでここでは扱わない
/// - このServiceでは、主に状態の変更などのメソッドを提供する
class TimerStateService {
  final SettingModel _settingModel;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isSoundedAlert = false; // カウントダウンサウンドを鳴らしたかどうか

  /// コンストラクタ
  TimerStateService({
    required SettingModel settingModel,
  }) : _settingModel = settingModel;

  /// 終了判定
  /// true: 終了、false: 継続
  bool isFinished(TimerState state) {
    // 次が長期休憩＆残りセット数が1＆時間が0秒の場合は終了
    return _getNextTimerType(state) == TimerType.longRest &&
        state.remainingSets == 1;
  }

  /// 次のタイマーをセットする
  TimerState setNextTimer(TimerState state) {
    state = state.copyWith(
      type: _getNextTimerType(state),
      remainingTime: _getNextTime(state),
    );
    // 作業が完了した後にセット数をデクリメント
    if (state.type != TimerType.work) {
      state = _decrementSets(state);
    }

    return state;
  }

  /// カウントダウンサウンドを鳴らす
  Future<void> playCountdownSound(TimerState state) async {
    if (isSoundedAlert) {
      // すでにアラートを鳴らしている場合＆0秒の時にフラグをリセット
      if (state.remainingTime.inSeconds == 0) {
        isSoundedAlert = false;
      }
    } else {
      isSoundedAlert = true;
      await _audioPlayer
          .play(AssetSource('sounds/countdown_before_3seconds.mp3'));
    }
  }

  /// 完了アラートを鳴らす
  Future<void> playCompleteSound() async {
    await _audioPlayer.play(AssetSource('sounds/success_1.mp3'));
  }

  /// バイブレーションを実行する
  Future<void> vibrate() async {
    // バイブレーションを実行
    Vibration.vibrate();
  }

  /// セット数のカウントダウン
  /// - 残りセット数、長期休憩までの残りセット数をデクリメント
  /// - 作業が完了した後（休憩の前）に実行
  TimerState _decrementSets(TimerState state) {
    if (state.remainingUntilLongBreak == 1) {
      // 長期休憩までの残りセット数が1の場合は長期休憩までの残りセット数をリセットし、セット数をデクリメント
      state = state.copyWith(
        remainingSets: state.remainingSets - 1,
        remainingUntilLongBreak: _settingModel.numberUntilLongBreak,
      );
    } else {
      state = state.copyWith(
        remainingUntilLongBreak: state.remainingUntilLongBreak - 1,
      );
    }
    return state;
  }

  /// 次のタイマーの種類を取得する
  TimerType _getNextTimerType(TimerState state) {
    TimerType nextType;

    if (state.type == TimerType.work) {
      // 長期休憩までのカウントが1の場合は長期休憩、それ以外は休憩
      nextType = state.remainingUntilLongBreak == 1
          ? TimerType.longRest
          : TimerType.rest;
    } else {
      // 種類が作業以外の場合は休憩なので、次は必ず作業になる
      nextType = TimerType.work;
    }

    return nextType;
  }

  /// 次のタイマーの時間を取得する
  Duration _getNextTime(TimerState state) {
    Duration nextTime;

    switch (_getNextTimerType(state)) {
      case TimerType.work:
        nextTime = Duration(minutes: _settingModel.workTime);
        break;
      case TimerType.rest:
        nextTime = Duration(minutes: _settingModel.breakTime);
        break;
      case TimerType.longRest:
        nextTime = Duration(minutes: _settingModel.longBreakTime);
        break;
    }

    return nextTime;
  }
}
