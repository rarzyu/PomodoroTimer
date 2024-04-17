import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/repositories/setting_repository.dart';

/// SettingModelの状態管理
final settingProvider =
    StateNotifierProvider<SettingNotifier, SettingModel>((ref) {
  final notifier = SettingNotifier(SettingModel.defaultSetting); // 初期ダミーデータを設定
  ref.onDispose(notifier.dispose);
  notifier.init(); // 初期化メソッドを呼び出し
  return notifier;
});

class SettingNotifier extends StateNotifier<SettingModel> {
  final SettingRepository _settingRepository = SettingRepository();

  SettingNotifier(SettingModel state) : super(state);

  @override
  get state => super.state;

  /// 初期化
  Future<void> init() async {
    state = await _settingRepository.load();
  }

  /// 保存
  void save() {
    _settingRepository.save(state);
  }

  /// 設定の変更
  void changeModel(var value, SettingKey key) {
    switch (key) {
      case SettingKey.workTime:
        state = state.copyWith(workTime: value);
        break;
      case SettingKey.breakTime:
        state = state.copyWith(breakTime: value);
        break;
      case SettingKey.longBreakTime:
        state = state.copyWith(longBreakTime: value);
        break;
      case SettingKey.numberUntilLongBreak:
        state = state.copyWith(numberUntilLongBreak: value);
        break;
      case SettingKey.numberSets:
        state = state.copyWith(numberSets: value);
        break;
      case SettingKey.isVibration:
        state = state.copyWith(isVibration: value);
        break;
      case SettingKey.isAlert:
        state = state.copyWith(isAlert: value);
        break;
    }

    save();
  }
}
