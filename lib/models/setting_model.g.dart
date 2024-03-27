// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingModelImpl _$$SettingModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingModelImpl(
      workTime: json['workTime'] as int,
      breakTime: json['breakTime'] as int,
      longBreakTime: json['longBreakTime'] as int,
      numberUntilLongBreak: json['numberUntilLongBreak'] as int,
      numberSets: json['numberSets'] as int,
      isVibration: json['isVibration'] as bool,
      isAlert: json['isAlert'] as bool,
    );

Map<String, dynamic> _$$SettingModelImplToJson(_$SettingModelImpl instance) =>
    <String, dynamic>{
      'workTime': instance.workTime,
      'breakTime': instance.breakTime,
      'longBreakTime': instance.longBreakTime,
      'numberUntilLongBreak': instance.numberUntilLongBreak,
      'numberSets': instance.numberSets,
      'isVibration': instance.isVibration,
      'isAlert': instance.isAlert,
    };
