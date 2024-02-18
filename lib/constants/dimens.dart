import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// UIの定義
/// 画面のサイズやマージン、パディングなどの定義
class AppDimens {
  
  // ##ニューモーフィズム
  // ニューモーフィズムのデフォルトスタイル
  static const NeumorphicStyle defaultNeumorphicStyle = NeumorphicStyle(
    shape: NeumorphicShape.flat,
    depth: 2,
  );

  // ##サイズ
  // フッターアイコンサイズ
  static const double footerIconSize = 40;

  // ##マージン
  // フッターアイコンマージン
  static const EdgeInsets footerIconMargin = EdgeInsets.all(20);

  // ##パディング
  // フッターアイコンパディング
  static const EdgeInsets footerIconPadding = EdgeInsets.all(10);
}