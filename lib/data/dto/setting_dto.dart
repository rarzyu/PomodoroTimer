
/// 設定項目のDTO
class SettingDto {
  final int workTime;
  final int breakTime;
  final int longBreakTime;
  final int numberUntilLongBreak;
  final int numberSets;
  final bool isVibration;
  final bool isAlert;

  SettingDto({
    required this.workTime,
    required this.breakTime,
    required this.longBreakTime,
    required this.numberUntilLongBreak,
    required this.numberSets,
    required this.isVibration,
    required this.isAlert,
  });
}
