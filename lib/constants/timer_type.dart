/// タイマーの種類を表す列挙型
enum TimerType {
  work, // 作業中
  rest, // 休憩中
  longRest; // 長い休憩中

  String name() {
    switch (this) {
      case TimerType.work:
        return 'work';
      case TimerType.rest:
        return 'rest';
      case TimerType.longRest:
        return 'longRest';
    }
  }
}
