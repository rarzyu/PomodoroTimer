import 'dart:convert';
import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoro_timer/models/setting_model.dart';

/// SharedPreferencesとのやりとりを行うリポジトリ
class SettingRepository {
  final SettingModel settingModel;

  SettingRepository({required this.settingModel});

  /// SharedPreferencesに保存
  Future<void> save() async {
    final preference = await SharedPreferences.getInstance();
    final json = settingModel.toJson;

    await preference.setString('setting', jsonEncode(json));
  }

  /// SharedPreferencesから取得
  Future<SettingModel> load() async {
    final preference = await SharedPreferences.getInstance();
    final json = preference.getString('setting');

    return json == null ? settingModel : SettingModel.fromJson(jsonDecode(json));
  }
}
