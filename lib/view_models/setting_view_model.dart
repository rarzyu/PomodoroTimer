import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/services/setting_service.dart';

/// 設定画面のViewModel
class SettingViewModel {
  SettingModel? settingModel;
  final SettingService _settingService;
  bool isLoaded = false;

  /// コンストラクタ
  SettingViewModel() : _settingService = SettingService();

  /// 初期化
  void initState() {
    init();
  }

  Future<void> init() async {
    settingModel = await _settingService.load();
    isLoaded = true;
  }

  /// 設定の保存
  void save() {
    _settingService.save(settingModel!);
  }

  /// 設定の変更
  void changeModel(var value, SettingKey key) {
    switch (key) {
      case SettingKey.workTime:
        settingModel = settingModel!.copyWith(workTime: value);
        break;
      case SettingKey.breakTime:
        settingModel = settingModel!.copyWith(breakTime: value);
        break;
      case SettingKey.longBreakTime:
        settingModel = settingModel!.copyWith(longBreakTime: value);
        break;
      case SettingKey.numberUntilLongBreak:
        settingModel = settingModel!.copyWith(numberUntilLongBreak: value);
        break;
      case SettingKey.numberSets:
        settingModel = settingModel!.copyWith(numberSets: value);
        break;
      case SettingKey.isVibration:
        settingModel = settingModel!.copyWith(isVibration: value);
        break;
      case SettingKey.isAlert:
        settingModel = settingModel!.copyWith(isAlert: value);
        break;
    }

    save();
  }
}
