// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  int get workTime => throw _privateConstructorUsedError;
  int get breakTime => throw _privateConstructorUsedError;
  int get longBreakTime => throw _privateConstructorUsedError;
  int get numberUntilLongBreak => throw _privateConstructorUsedError;
  int get numberSets => throw _privateConstructorUsedError;
  bool get isVibration => throw _privateConstructorUsedError;
  bool get isAlert => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {int workTime,
      int breakTime,
      int longBreakTime,
      int numberUntilLongBreak,
      int numberSets,
      bool isVibration,
      bool isAlert});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTime = null,
    Object? breakTime = null,
    Object? longBreakTime = null,
    Object? numberUntilLongBreak = null,
    Object? numberSets = null,
    Object? isVibration = null,
    Object? isAlert = null,
  }) {
    return _then(_value.copyWith(
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
      longBreakTime: null == longBreakTime
          ? _value.longBreakTime
          : longBreakTime // ignore: cast_nullable_to_non_nullable
              as int,
      numberUntilLongBreak: null == numberUntilLongBreak
          ? _value.numberUntilLongBreak
          : numberUntilLongBreak // ignore: cast_nullable_to_non_nullable
              as int,
      numberSets: null == numberSets
          ? _value.numberSets
          : numberSets // ignore: cast_nullable_to_non_nullable
              as int,
      isVibration: null == isVibration
          ? _value.isVibration
          : isVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlert: null == isAlert
          ? _value.isAlert
          : isAlert // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelImplCopyWith(
          _$SettingModelImpl value, $Res Function(_$SettingModelImpl) then) =
      __$$SettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int workTime,
      int breakTime,
      int longBreakTime,
      int numberUntilLongBreak,
      int numberSets,
      bool isVibration,
      bool isAlert});
}

/// @nodoc
class __$$SettingModelImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelImpl>
    implements _$$SettingModelImplCopyWith<$Res> {
  __$$SettingModelImplCopyWithImpl(
      _$SettingModelImpl _value, $Res Function(_$SettingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTime = null,
    Object? breakTime = null,
    Object? longBreakTime = null,
    Object? numberUntilLongBreak = null,
    Object? numberSets = null,
    Object? isVibration = null,
    Object? isAlert = null,
  }) {
    return _then(_$SettingModelImpl(
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
      longBreakTime: null == longBreakTime
          ? _value.longBreakTime
          : longBreakTime // ignore: cast_nullable_to_non_nullable
              as int,
      numberUntilLongBreak: null == numberUntilLongBreak
          ? _value.numberUntilLongBreak
          : numberUntilLongBreak // ignore: cast_nullable_to_non_nullable
              as int,
      numberSets: null == numberSets
          ? _value.numberSets
          : numberSets // ignore: cast_nullable_to_non_nullable
              as int,
      isVibration: null == isVibration
          ? _value.isVibration
          : isVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlert: null == isAlert
          ? _value.isAlert
          : isAlert // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingModelImpl implements _SettingModel {
  const _$SettingModelImpl(
      {required this.workTime,
      required this.breakTime,
      required this.longBreakTime,
      required this.numberUntilLongBreak,
      required this.numberSets,
      required this.isVibration,
      required this.isAlert});

  factory _$SettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingModelImplFromJson(json);

  @override
  final int workTime;
  @override
  final int breakTime;
  @override
  final int longBreakTime;
  @override
  final int numberUntilLongBreak;
  @override
  final int numberSets;
  @override
  final bool isVibration;
  @override
  final bool isAlert;

  @override
  String toString() {
    return 'SettingModel(workTime: $workTime, breakTime: $breakTime, longBreakTime: $longBreakTime, numberUntilLongBreak: $numberUntilLongBreak, numberSets: $numberSets, isVibration: $isVibration, isAlert: $isAlert)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelImpl &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.breakTime, breakTime) ||
                other.breakTime == breakTime) &&
            (identical(other.longBreakTime, longBreakTime) ||
                other.longBreakTime == longBreakTime) &&
            (identical(other.numberUntilLongBreak, numberUntilLongBreak) ||
                other.numberUntilLongBreak == numberUntilLongBreak) &&
            (identical(other.numberSets, numberSets) ||
                other.numberSets == numberSets) &&
            (identical(other.isVibration, isVibration) ||
                other.isVibration == isVibration) &&
            (identical(other.isAlert, isAlert) || other.isAlert == isAlert));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, workTime, breakTime,
      longBreakTime, numberUntilLongBreak, numberSets, isVibration, isAlert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      __$$SettingModelImplCopyWithImpl<_$SettingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingModelImplToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  const factory _SettingModel(
      {required final int workTime,
      required final int breakTime,
      required final int longBreakTime,
      required final int numberUntilLongBreak,
      required final int numberSets,
      required final bool isVibration,
      required final bool isAlert}) = _$SettingModelImpl;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$SettingModelImpl.fromJson;

  @override
  int get workTime;
  @override
  int get breakTime;
  @override
  int get longBreakTime;
  @override
  int get numberUntilLongBreak;
  @override
  int get numberSets;
  @override
  bool get isVibration;
  @override
  bool get isAlert;
  @override
  @JsonKey(ignore: true)
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
