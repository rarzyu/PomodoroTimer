// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerState {
  TimerStatus get status => throw _privateConstructorUsedError;
  TimerType get type => throw _privateConstructorUsedError;
  Duration get remainingTime => throw _privateConstructorUsedError;
  int get remainingSets =>
      throw _privateConstructorUsedError; // 残りセット数：SettingModel.numberSetsから減算する
  int get remainingUntilLongBreak => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {TimerStatus status,
      TimerType type,
      Duration remainingTime,
      int remainingSets,
      int remainingUntilLongBreak});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? type = null,
    Object? remainingTime = null,
    Object? remainingSets = null,
    Object? remainingUntilLongBreak = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimerType,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      remainingSets: null == remainingSets
          ? _value.remainingSets
          : remainingSets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingUntilLongBreak: null == remainingUntilLongBreak
          ? _value.remainingUntilLongBreak
          : remainingUntilLongBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimerStatus status,
      TimerType type,
      Duration remainingTime,
      int remainingSets,
      int remainingUntilLongBreak});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? type = null,
    Object? remainingTime = null,
    Object? remainingSets = null,
    Object? remainingUntilLongBreak = null,
  }) {
    return _then(_$TimerStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimerType,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      remainingSets: null == remainingSets
          ? _value.remainingSets
          : remainingSets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingUntilLongBreak: null == remainingUntilLongBreak
          ? _value.remainingUntilLongBreak
          : remainingUntilLongBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl implements _TimerState {
  const _$TimerStateImpl(
      {required this.status,
      required this.type,
      required this.remainingTime,
      required this.remainingSets,
      required this.remainingUntilLongBreak});

  @override
  final TimerStatus status;
  @override
  final TimerType type;
  @override
  final Duration remainingTime;
  @override
  final int remainingSets;
// 残りセット数：SettingModel.numberSetsから減算する
  @override
  final int remainingUntilLongBreak;

  @override
  String toString() {
    return 'TimerState(status: $status, type: $type, remainingTime: $remainingTime, remainingSets: $remainingSets, remainingUntilLongBreak: $remainingUntilLongBreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.remainingSets, remainingSets) ||
                other.remainingSets == remainingSets) &&
            (identical(
                    other.remainingUntilLongBreak, remainingUntilLongBreak) ||
                other.remainingUntilLongBreak == remainingUntilLongBreak));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, type, remainingTime,
      remainingSets, remainingUntilLongBreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  const factory _TimerState(
      {required final TimerStatus status,
      required final TimerType type,
      required final Duration remainingTime,
      required final int remainingSets,
      required final int remainingUntilLongBreak}) = _$TimerStateImpl;

  @override
  TimerStatus get status;
  @override
  TimerType get type;
  @override
  Duration get remainingTime;
  @override
  int get remainingSets;
  @override // 残りセット数：SettingModel.numberSetsから減算する
  int get remainingUntilLongBreak;
  @override
  @JsonKey(ignore: true)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
