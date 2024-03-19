import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// 設定画面のテキスト項目
class SettingTextItemComponent extends StatelessWidget {
  final String title;

  SettingTextItemComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: screenWidth * 0.05),
          itemLabel(context, title),
          Container(width: screenWidth * 0.1),
          textField(context),
        ],
      ),
    );
  }

  /// 項目ラベル
  Widget itemLabel(BuildContext context, String title) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.45,
      child: Text(
        title,
        style: AppDimens.baseTextStyle.copyWith(
          fontSize: AppDimens.settingItemTextSize,
        ),
      ),
    );
  }

  /// テキストフィールド
  Widget textField(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.25,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -5,
          boxShape: NeumorphicBoxShape.rect(),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          maxLines: 1,
          maxLength: 3,
          keyboardType: TextInputType.number,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: AppDimens.settingItemTextSize,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }
}
