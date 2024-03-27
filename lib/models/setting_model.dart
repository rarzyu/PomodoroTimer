import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

/// 設定項目のModel
@freezed
class SettingModel with _$SettingModel {
  const factory SettingModel({
    required int workTime,
    required int breakTime,
    required int longBreakTime,
    required int numberUntilLongBreak,
    required int numberSets,
    required bool isVibration,
    required bool isAlert,
  }) = _SettingModel;

  /// JSONからモデルに変換
  /// ※json_serializableを採用しているので、JSONへの変換は自動生成される
  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}