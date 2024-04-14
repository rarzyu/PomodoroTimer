/// タイマーの状態を表す列挙型
enum TimerState {
  running,  // タイマーが動いている状態
  stopped,  // タイマーが止まっている状態
  paused;  // タイマーが一時停止している状態

  String name() {
    switch (this) {
      case TimerState.running:
        return 'running';
      case TimerState.stopped:
        return 'stopped';
      case TimerState.paused:
        return 'paused';
    }
  }
}
