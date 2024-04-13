import 'package:pomodoro_timer/models/setting_model.dart';
import 'package:pomodoro_timer/repositories/setting_repository.dart';

/// 設定項目のService
class SettingService {
  final SettingRepository _settingRepository;

  /// コンストラクタ
  SettingService() : _settingRepository = SettingRepository();

  /// 設定の保存
  void save(SettingModel settingModel) {
    _settingRepository.save(settingModel);
  }

  /// 設定の読み込み
  Future<SettingModel> load() async {
    return await _settingRepository.load();
  }
}
