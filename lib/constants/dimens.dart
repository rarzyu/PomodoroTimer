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
  // 基準となるスクリーンサイズ
  static const double baseScreenWidth = 375.0;
  static const double baseScreenHeight = 665.0;

  // 上記基準をもとにしたテキストサイズ
  static const double baseSettingTextSize = 17;
  static const double baseTitleTextSize = 32;
  static const double baseTimerTextSize = 48;
  static const double baseLargeButtonTextSize = 22;
  static const double baseSmallButtonTextSize = 18;

  // 上記基準をもとにしたボタンサイズ
  static const double baseLargeButtonWidth = 180;
  static const double baseSmallButtonWidth = 100;

  // ##マージン

  // ##パディング

  // ##テキストスタイル
  // テキストの影
  static const Shadow textShadow = Shadow(
    color: Color.fromRGBO(30, 30, 30, 0.3),
    offset: Offset(1, 2),
    blurRadius: 2,
  );

  // テキストのベーススタイル
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: 'Noto Sans JP',
    fontWeight: FontWeight.w100,
    shadows: [textShadow],
    color: AppColors.baseText,
  );
}
