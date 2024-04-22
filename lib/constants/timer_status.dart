/// タイマーの状態を表す列挙型
enum TimerStatus {
  running,  // タイマーが動いている状態
  stopped,  // タイマーが止まっている状態
  paused;  // タイマーが一時停止している状態

  String name() {
    switch (this) {
      case TimerStatus.running:
        return 'running';
      case TimerStatus.stopped:
        return 'stopped';
      case TimerStatus.paused:
        return 'paused';
    }
  }
}
