

/// 時刻などをフォーマットする処理群
class FormatUtil {
  
  /// Durationをmm:ss形式の文字列に変換する関数
  String formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}