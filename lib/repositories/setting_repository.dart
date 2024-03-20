import 'dart:convert';
import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoro_timer/data/dto/setting_dto.dart';

/// SharedPreferencesとのやりとりを行うリポジトリ
class SettingRepository {
  final SettingDto settingDto;

  SettingRepository({required this.settingDto});

  /// SharedPreferencesに保存
  Future<void> save() async {
    final preference = await SharedPreferences.getInstance();
    final json = _toJson();

    await preference.setString('setting', jsonEncode(json));
  }

  /// SharedPreferencesから取得
  Future<SettingDto> load() async {
    final preference = await SharedPreferences.getInstance();
    final json = preference.getString('setting');

    return json == null ? settingDto : _fromJson(jsonDecode(json));
  }

  /// DTO→JSONに変換
  /// private
  Map<String, dynamic> _toJson() {
    return {
      SettingKey.workTime.key(): settingDto.workTime,
      SettingKey.breakTime.key(): settingDto.breakTime,
      SettingKey.longBreakTime.key(): settingDto.longBreakTime,
      SettingKey.numberUntilLongBreak.key(): settingDto.numberUntilLongBreak,
      SettingKey.numberSets.key(): settingDto.numberSets,
      SettingKey.isVibration.key(): settingDto.isVibration,
      SettingKey.isAlert.key(): settingDto.isAlert,
    };
  }

  /// JSON→DTOに変換
  /// private
  SettingDto _fromJson(Map<String, dynamic> json) {
    return SettingDto(
      workTime: json[SettingKey.workTime.key()],
      breakTime: json[SettingKey.breakTime.key()],
      longBreakTime: json[SettingKey.longBreakTime.key()],
      numberUntilLongBreak: json[SettingKey.numberUntilLongBreak.key()],
      numberSets: json[SettingKey.numberSets.key()],
      isVibration: json[SettingKey.isVibration.key()],
      isAlert: json[SettingKey.isAlert.key()],
    );
  }
}
