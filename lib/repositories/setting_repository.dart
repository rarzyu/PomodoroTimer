import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoro_timer/models/setting_model.dart';

/// SharedPreferencesとのやりとりを行うリポジトリ
class SettingRepository {

  /// SharedPreferencesに保存
  Future<void> save(SettingModel settingModel) async {
    final preference = await SharedPreferences.getInstance();
    final json = settingModel.toJson();

    await preference.setString('setting', jsonEncode(json));
  }

  /// SharedPreferencesから取得
  Future<SettingModel> load() async {
    final preference = await SharedPreferences.getInstance();
    final json = preference.getString('setting');

    return json == null ? SettingModel.defaultSetting : SettingModel.fromJson(jsonDecode(json));
  }
}
