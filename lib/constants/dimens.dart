import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/colors.dart';

/// UIの定義
/// 画面のサイズやマージン、パディングなどの定義
/// - 各画面でしか使わない定義はここに書かない
class AppDimens {
  // ##ニューモーフィズム
  // ニューモーフィズムのデフォルトスタイル
  static const NeumorphicStyle defaultNeumorphicStyle = NeumorphicStyle(
    shape: NeumorphicShape.flat,
    depth: 2,
  );

  // ##サイズ

  // ##マージン

  // ##パディング

  // ##テキストスタイル
  // テキストの影
  static const Shadow textShadow = Shadow(
    color: Color.fromRGBO(30, 30, 30, 0.4),
    offset: Offset(2, 2),
    blurRadius: 3,
  );

  // テキストのベーススタイル
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: 'Noto Sans JP',
    fontWeight: FontWeight.w100,
    shadows: [textShadow],
    color: AppColors.baseText,
  );
}
