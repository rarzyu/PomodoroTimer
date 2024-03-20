/// SharedPreferencesに保存するキー
enum SettingKey {
  workTime,
  breakTime,
  longBreakTime,
  numberUntilLongBreak,
  numberSets,
  isVibration,
  isAlert;

  String key() {
    switch (this) {
      case SettingKey.workTime:
        return 'workTime';
      case SettingKey.breakTime:
        return 'breakTime';
      case SettingKey.longBreakTime:
        return 'longBreakTime';
      case SettingKey.numberUntilLongBreak:
        return 'numberUntilLongBreak';
      case SettingKey.numberSets:
        return 'numberSets';
      case SettingKey.isVibration:
        return 'isVibration';
      case SettingKey.isAlert:
        return 'isAlert';
    }
  }
}
