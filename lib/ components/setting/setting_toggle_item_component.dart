import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// 設定画面のトグル項目
class SettingToggleItemComponent extends StatelessWidget {
  final String title;
  final bool value;

  const SettingToggleItemComponent({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: screenWidth * 0.05),
          itemLabel(context, title),
          Container(width: screenWidth * 0.15),
          toggleSwitch(context),
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

  /// トグルスイッチ
  Widget toggleSwitch(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.035,
      child: NeumorphicSwitch(
        style: NeumorphicSwitchStyle(
          thumbDepth: 2,
          activeTrackColor: Colors.green,
          inactiveTrackColor: Colors.grey,
        ),
        // TODO: 状態管理および切り替え処理を実装する
        value: value,
        onChanged: (bool value) {
          value = !value;
        },
      ),
    );
  }
}
